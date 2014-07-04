class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender
  belongs_to :recipient

  validates_presence_of :conversation_id
  validates_presence_of :sender_id
  validates_presence_of :recipient_id

  has_paper_trail

  def value
    raise NotImplementedError
  end
end
