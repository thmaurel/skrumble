# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.name = "Bob"
u.surname = "Bob"
u.username = "Bob"
u.email = "abc@gmail.com"
u.password = "abc123"
u.password_confirmation = "abc123"
u.save

puts "User created"

c = Country.new
c.name = "France"
c.save

puts "Country created"

t = Trip.new
t.start_date = "Fri, 24 May 2019"
t.end_date = "Fri, 24 May 2020"
t.country_id = 1
t.user_id = 1
t.save

puts "Trip created"
