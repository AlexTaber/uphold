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