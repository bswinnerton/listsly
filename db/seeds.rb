# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brooks = User.find_or_initialize_by(email: 'bswinnerton@gmail.com') do |u|
  u.name = 'Brooks Swinnerton'
  u.encrypted_password = '$2a$10$XJ8sD58cfkhPNPZxAFFyLuzh1/bEXA4yU/TiQc4XO0P1.K6mGJyv6'
  u.created_at = Time.now
  u.updated_at = Time.now
  u.confirmed_at = Time.now
  u.is_admin = true
end.tap{ |u| u.save!(validate: false) }

sender        = Sender.create(email: brooks.email, name: brooks.name)
recipient     = Recipient.create(email: 'cats@lists.ly', name: 'cats')
conversation  = Conversation.create(name: 'cats')
                Email.create(
                  sender: sender,
                  recipient: recipient,
                  conversation: conversation,
                  html_value: '<img src="http://media3.giphy.com/media/12bjQ7uASAaCKk/giphy.gif"/>',
                  text_value: 'Cats.',
                  received_at: Time.now,
                  sent_at: Time.now - 10.seconds
                )
