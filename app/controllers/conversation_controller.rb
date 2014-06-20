class ConversationController < ApplicationController
  def index
  end

  def show
    @conversation = Conversation.find_by(name: params[:conversation_name])
    if @conversation
      @posts = @conversation.messages.order(created_at: :desc)
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
