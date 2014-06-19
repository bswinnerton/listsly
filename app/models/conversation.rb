class Conversation < ActiveRecord::Base
  delegate :name, to: :recipient
end
