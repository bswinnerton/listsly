class Conversation < ActiveRecord::Base
  has_many :messages

  validates_presence_of :name

  has_paper_trail
end
