# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: 'ceci est une fucking description looooool', password: "goodjob")
end


10.times do
  event = Event.create!(title: Faker::OnePiece.sea, description: 'ceci est une fucking description loooioool', start_date: Faker::Date.forward(rand(1..23)), duration: rand(1...10)*5, location: Faker::Nation.capital_city, price: rand(1..1000), user_id: User.all.ids.sample)
end  


10.times do
  attendance = Attendance.create!(user_id: User.all.ids.sample, event_id: Event.all.ids.sample)
end  



