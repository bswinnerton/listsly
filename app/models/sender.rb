class Sender < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email

  def self.find_or_create_for_mandrill_event!(email, name)
    find_or_create_by!(email: email) do |s|
      s.name = name
    end
  end

  def gravatar_email_hash
    Digest::MD5.hexdigest(email.downcase.strip)
  end
end
