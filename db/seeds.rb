# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all
TripEvent.destroy_all
TripItem.destroy_all
Trip.destroy_all
Item.destroy_all
Event.destroy_all
Task.destroy_all
Country.destroy_all
User.destroy_all


u = User.new
u.first_name = "Emeric"
u.last_name = "Le Bail"
#u.username = "Bob"
u.email = "emeric@gmail.com"
u.password = "abc123"
u.password_confirmation = "abc123"
u.save

u = User.new
u.first_name = "Raphael"
u.last_name = "Mantello"
#u.username = "Bob"
u.email = "raphael@gmail.com"
u.remote_photo_url = "https://kitt.lewagon.com/placeholder/users/raphmantello"
u.password = "abc123"
u.password_confirmation = "abc123"
u.save

puts "User created"

CSV.foreach('countries.csv') do |row|
  c = Country.new
  c.name = row[0]
  c.remote_photo_url = row[1] if row.size == 2
  c.save
end

puts "Countries created"

item = ["Pullover", "Short", "Socks", "T-shirt", "Underwear", "Toilet bag"]

item.each do |it|
  i = Item.new
  i.name = it
  i.ratio = 1
  i.ratio = 0.3 if it == "Pullover"
  i.ratio = 0 if it == "Toilet bag"
  if i.name == "Pullover"
    i.icon = "hoodie.svg"
    i.category = 1
  elsif i.name == "Short"
    i.icon = "shorts.svg"
    i.category = 2
  elsif i.name == "Socks"
    i.icon = "socks.svg"
    i.category = 3
  elsif i.name == "T-shirt"
    i.icon = "tshirt.svg"
    i.category = 4
  elsif i.name == "Underwear"
    i.icon = "underwear.svg"
    i.category = 5
  elsif i.name == "Toilet bag"
    i.icon = "toiletries.svg"
    i.category = 6
  end
  i.save
end

puts "Items created"

# tasks = ["visa", "passeport", "vaccin fievre jaune", "medicament paludisme"]

taco = Country.find_by(name: "North Korea")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.category = 1
ta.icon = "passport.svg"
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.category = 2
ta.icon = "visa.svg"
ta.save
ta = Task.new
ta.name = "Rabies"
ta.icon = "vaccin.svg"
ta.category = 5
ta.country = taco
ta.save

taco = Country.find_by(name: "Indonesia")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.category = 1
ta.icon = "passport.svg"
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.category = 2
ta.icon = "visa.svg"
ta.save
ta = Task.new
ta.name = "Rabies"
ta.icon = "vaccin.svg"
ta.category = 5
ta.country = taco
ta.save

taco = Country.find_by(name: "New Zealand")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.category = 1
ta.icon = "passport.svg"
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.category = 2
ta.icon = "visa.svg"
ta.save
ta = Task.new
ta.name = "Rabies"
ta.icon = "vaccin.svg"
ta.category = 5
ta.country = taco
ta.save

taco = Country.find_by(name: "Namibia")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.category = 1
ta.icon = "passport.svg"
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.category = 2
ta.icon = "visa.svg"
ta.save
ta = Task.new
ta.name = "Rabies"
ta.icon = "vaccin.svg"
ta.category = 5
ta.country = taco
ta.save

puts "Tasks created"

e = Event.new
e.name = "Scuba diving"
e.category = "Watersport"
e.remote_photo_url = "https://nature-plongee.com/wp-content/uploads/voyage-plongee-saba-caraibes-m-j41.jpg"
e.description = "Try new things, don't be a cheap bastard"
e.start_date = "Fri, 24 May 2019"
e.end_date = "Fri, 24 May 2019"
e.save

ev = Event.new
ev.name = "Forest walk"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://www.wedemain.fr/photo/art/grande/28623324-28127445.jpg?v=1544095128"
ev.description = "Try new things, don't be a cheap bastard"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.save

eve = Event.new
eve.name = "Barbecue"
eve.category = "Food"
eve.remote_photo_url = "https://previews.123rf.com/images/innocent/innocent1003/innocent100300039/11710255-gros-plan-d-un-barbecue-d-%C3%A9t%C3%A9-.jpg"
eve.description = "Try new things, don't be a cheap bastard"
eve.start_date = "Fri, 24 May 2019"
eve.end_date = "Fri, 24 May 2019"
eve.save

ev = Event.new
ev.name = "Walk in the desert"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://images.unsplash.com/photo-1489493585363-d69421e0edd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
ev.description = "Try new things, don't be a cheap bastard"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.save
