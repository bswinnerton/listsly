module ConversationHelper
  def conversation_friendly_date(post)
    post.received_at.strftime("%B #{post.received_at.day.ordinalize} %Y at %l:%M%p")
  end
end
