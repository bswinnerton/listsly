class Email < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender
  belongs_to :recipient

  validates_presence_of :conversation_id
  validates_presence_of :sender_id
  validates_presence_of :recipient_id

  def value
    if html_value
      html_value.html_safe
    elsif text_value
      text_value
    end
  end
end
