# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

User.create!(
  id: ENV['ID'],
  name: 'Mihael',
  email: 'hogehoge@example.com',
  password: 'hogehoge',
  # email: ENV['EMAIL'],
  # password: ENV['PASSWORD'],
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

100.times do |n|
  name = Faker::Games::Pokemon.name
  # phone_number = Faker::Number.leading_zero_number(digits: 10)
  phone_number = "12345678910"
  address = Faker::JapaneseMedia::Naruto.village
  content = Faker::Games::StreetFighter.move
  Shop.create!(
    user_id: 1,
    name: name,
    phone_number: phone_number,
    address: address,
    content: content,
  )
end


