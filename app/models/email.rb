class Email < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender
  belongs_to :recipient
end
