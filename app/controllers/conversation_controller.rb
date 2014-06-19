class ConversationController < ApplicationController
  def index
  end

  def show
    @recipient = Recipient.find_by(email: "#{params[:conversation_name]}@lists.ly")
    if @recipient
      @posts = Email.where(recipient: @recipient).order(created_at: :desc)
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
