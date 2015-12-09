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
    name: Faker::Book.title ,
    bio: Faker::Hipster.paragraph(3) + "\r\n\r\n" + Faker::Hipster.paragraph(2)
  )

  band_image = Image.create(
    url: "http://p4cdn4static.sharpschool.com/UserFiles/Servers/Server_91869/Image/Band4.jpg",
    imageable_id: band.id,
    imageable_type: "Band"
  )
end

5.times do |x|
  agency.bands << Band.find(x + 1)
  management.bands << Band.find(x + 6)
end

50.times do |x|
  musician = Musician.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Hipster.paragraph(3) + "\r\n\r\n" + Faker::Hipster.paragraph(2),
    instruments: Faker::Hipster.word.capitalize
  )

  musician_image = Image.create(
    url: Faker::Avatar.image,
    imageable_id: musician.id,
    imageable_type: "Musician"
  )

  band_member = BandMember.create(
    musician_id: musician.id,
    band_id: rand(1..15)
  )
end

5.times do |x|
  venue = Venue.create(
    name: Faker::Book.title,
    bio: Faker::Hipster.paragraph(3) + "\r\n\r\n" + Faker::Hipster.paragraph(2)
  )

  venue_image = Image.create(
    url: "https://upload.wikimedia.org/wikipedia/commons/5/54/VENUE-2-02.jpg",
    imageable_id: venue.id,
    imageable_type: "Venue"
  )
end

10.times do |x|
  random_time = Faker::Time.between(DateTime.now - 30, DateTime.now + 100)

  event = Event.create(
    name: Faker::Hipster.sentence(3),
    description: Faker::Hipster.paragraph(3) + "\r\n\r\n" + Faker::Hipster.paragraph(2),
    total_headliners: 1,
    live: x < 8,
    start_time: random_time,
    end_time: random_time + 3.hours,
    venue_id: rand(1..5)
  )

  randomized_bands = Band.all.order("RANDOM()")

  rand(3..8).times do |x|
    booking = Booking.create(
      band_id: randomized_bands[x].id,
      event_id: event.id,
      rank: x
    )
  end

  event_image = Image.create(
    url: "/assets/concert",
    imageable_id: event.id,
    imageable_type: "Event"
  )

end

