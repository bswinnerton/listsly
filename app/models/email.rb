class Email < Message
  def value
    if html_value
      html_value
    elsif text_value
      text_value
    end
  end
end
