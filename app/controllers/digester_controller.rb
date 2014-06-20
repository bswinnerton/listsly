class DigesterController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:email]

  def email
    if params[:mandrill_events]
      @events = JSON.parse(params[:mandrill_events])
      @events.each do |event|
        ActiveRecord::Base.transaction do
          mandrill_event  = MandrillEvent.new(event)
          sender          = Sender.find_or_create_for_mandrill_event!(mandrill_event.from_email, mandrill_event.from_name)
          recipient       = Recipient.find_or_create_for_mandrill_event!(mandrill_event.to_email, mandrill_event.to_name)
          conversation    = Conversation.find_or_create_by!(name: recipient.conversation_friendly_name)
          Email.create!(
            conversation: conversation,
            sender: sender,
            recipient: recipient,
            html_value: mandrill_event.html_value,
            text_value: mandrill_event.text_value,
          )
        end
      end
      render nothing: true, status: 200
    else
      render nothing: true, status: 404
    end
  end
end
