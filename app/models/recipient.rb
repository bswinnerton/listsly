class Recipient < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email

  has_paper_trail

  def self.find_or_create_for_mandrill_event!(email, name)
    find_or_create_by!(email: email) do |s|
      s.name = name
    end
  end

  def conversation_friendly_name
    email.gsub(/^(.*)@.*$/, '\1')
  end
end
