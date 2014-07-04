class DigestionWorker
  include Sidekiq::Worker

  def perform(mandrill_events)
    PaperTrail.whodunnit = 'Email Import Robot'

    events = JSON.parse(mandrill_events)
    events.each do |event|
      ActiveRecord::Base.transaction do
        mandrill_event  = MandrillEvent.new(event)
        sender          = Sender.find_or_create_for_mandrill_event!(mandrill_event.from_email, mandrill_event.from_name)
        recipient       = Recipient.find_or_create_for_mandrill_event!(mandrill_event.to_email, mandrill_event.to_name)
        conversation    = Conversation.find_or_create_by!(name: recipient.conversation_friendly_name)
        Email.create!(
          conversation: conversation,
          sender: sender,
          recipient: recipient,
          received_at: mandrill_event.received_at,
          html_value: mandrill_event.html_value,
          text_value: mandrill_event.text_value,
        )
      end
    end
  end
end
