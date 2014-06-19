class DigesterController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:email]

  def email
    if params[:mandrill_events]
      @events = JSON.parse(params[:mandrill_events]) if params[:mandrill_events]
      @events.each do |event|
        sender = Sender.find_or_create_by(email: event['msg']['from_email']) do |s|
          s.name = event['msg']['from_name']
        end
        recipient = Recipient.find_or_create_by(email: event['msg']['email']) do |s|
          s.name = event['msg']['to'].last.last
        end
        Email.create(sender: sender, recipient: recipient, text_value: event['msg']['text'], html_value: event['msg']['html'])
      end
      render nothing: true, status: 200
    else
      render nothing: true, status: 404
    end
  end
end
