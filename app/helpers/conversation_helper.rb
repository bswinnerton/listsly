module ConversationHelper
  def stripped_break_tags(value)
    value.gsub(/(<br( |\/| \/)?>)+/, "\n").strip.html_safe
  end

  def conversation_friendly_date(post)
    post.received_at.strftime("%B #{post.received_at.day.ordinalize} %Y at %l:%M%p")
  end

  def gravatar_image_tag(sender, options = {})
    if options[:size] == :small
      image_tag "http://www.gravatar.com/avatar/#{sender.gravatar_email_hash}?s=20&d=blank", alt: 'Gravatar Image', class: 'img-circle'
    else
      image_tag "http://www.gravatar.com/avatar/#{sender.gravatar_email_hash}?d=blank", alt: 'Gravatar Image', class: 'img-circle'
    end
  end
end
