# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
Event.destroy_all
EventUser.destroy_all
User.destroy_all
HotelUser.destroy_all
Hotel.destroy_all


Location.create(city: "Austin, TX")
Location.create(city: "San Diego, CA")
Location.create(city: "Nashville, TN")
Location.create(city: "Indio, CA")
Location.create(city: "Manchester, TN")
Location.create(city: "Washington, DC")
Location.create(city: "Chicago, IL")
Location.create(city: "Tampa, FL")
Location.create(city: "Las Vegas, NV")
Location.create(city: "Los Angeles, CA")
Location.create(city: "Atlanta, GA")

100.times do
    Hotel.create(name: "#{Faker::NatoPhoneticAlphabet.code_word} Hotel", room_rate: rand(80..200), location_id: Location.all.sample.id)
end

Event.create(location_id: Location.find_by(city: "Austin, TX").id, name: "South by Southwest", type_of_event: "Concert", ticket_cost: 900, date: 03-12-2021)
Event.create(location_id: Location.find_by(city: "San Diego, CA").id, name: "Comic-Con", type_of_event: "Convention", ticket_cost: 70, date: 07-22-2021)
Event.create(location_id: Location.find_by(city: "Nashville, TN").id, name: "CMA Fest", type_of_event: "Concert", ticket_cost: 180, date: 06-10-2021)
Event.create(location_id: Location.find_by(city: "Indio, CA").id, name: "Coachella", type_of_event: "Concert", ticket_cost: 399, date: 04-10-2021)
Event.create(location_id: Location.find_by(city: "Manchester, TN").id, name: "Bonnaroo", type_of_event: "Concert", ticket_cost: 319, date: 06-17-2021)
Event.create(location_id: Location.find_by(city: "Washington, DC").id, name: "Awesome-Con", type_of_event: "Convention", ticket_cost: 80, date: 12-11-2020)
Event.create(location_id: Location.find_by(city: "Chicago, IL").id, name: "Lollapalooza", type_of_event: "Concert", ticket_cost: 340, date: 07-30-2021)
Event.create(location_id: Location.find_by(city: "Tampa, FL").id, name: "Super Bowl LV", type_of_event: "Sports", ticket_cost: 4000, date: 02-10-2021)
Event.create(location_id: Location.find_by(city: "Las Vegas, NV").id, name: "NFL Draft", type_of_event: "Sports", ticket_cost: 50, date: 04-29-2021)
Event.create(location_id: Location.find_by(city: "Los Angeles, CA").id, name: "Electronics Entertainment Expo", type_of_event: "Convention", ticket_cost: 250, date: 06-15-2021)
Event.create(location_id: Location.find_by(city: "Atlanta, GA").id, name: "MLB All-Star Game", type_of_event: "Sports", ticket_cost: 1500, date: 07-13-2021)

10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Esport.unique.player, password_digest: Faker::Hipster.word)
end

50.times do 
    EventUser.create(user_id: User.all.sample.id, event_id: Event.all.sample.id)
end

50.times do
    HotelUser.create(user_id: User.all.sample.id, hotel_id: Hotel.all.sample.id, length_of_stay: rand(1..4))
end