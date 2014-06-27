# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_initialize_by(email: 'bswinnerton@gmail.com') do |u|
  u.encrypted_password = '$2a$10$XJ8sD58cfkhPNPZxAFFyLuzh1/bEXA4yU/TiQc4XO0P1.K6mGJyv6'
  u.created_at = Time.now
  u.updated_at = Time.now
  u.confirmed_at = Time.now
  u.is_admin = true
end.save!(validate: false)
