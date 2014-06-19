class ConversationController < ApplicationController
  def index
    render text: 'Lists.ly', status: 200
  end

  def show
    @recipient = Recipient.find_by(email: "#{params[:conversation_name]}@lists.ly")
    if @recipient
      @posts = Email.where(recipient: @recipient)
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
