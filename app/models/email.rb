class Email < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender
  belongs_to :recipient

  def value
    if html_value
      html_value.html_safe
    elsif text_value
      text_value
    end
  end
end
