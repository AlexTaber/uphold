# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  email: "alex.taber0@gmail.com",
  first_name: "Alex",
  last_name: "Taber",
  password: "123",
  admin: true,
  bio: "This is the bio",
)

agency = Service.create(
  name: "Agency",
  description: "Band Promotion"
)

management = Service.create(
  name: "Management",
  description: "Band management"
)

15.times do |x|
  band = Band.create(
    name: Faker::Lorem.word.capitalize,
    bio: Faker::Lorem.paragraph(3) + "\r\n\r\n" + Faker::Lorem.paragraph(2)
  )
end

5.times do |x|
  agency.bands << Band.find(x)
  management.bands << Band.find(x + 5)
end

50.times do |x|
  musician = Musician.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph(3) + "\r\n\r\n" + Faker::Lorem.paragraph(2)
  )
end