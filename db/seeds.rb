# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'starting...'

Todo.destroy_all
TripEvent.destroy_all
TripItem.destroy_all
Trip.destroy_all
Item.destroy_all
Event.destroy_all
Task.destroy_all
Country.destroy_all
User.destroy_all

puts 'previous seed cleaned'

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
ctrytem = Country.find_by(name: "New Zealand")
item.each do |it|
  i = Item.new
  i.name = it
  i.ratio = 0.9
  i.ratio = 0.3 if it == "Short"
  i.ratio = 0.3 if it == "Pullover"
  i.ratio = 0 if it == "Toilet bag"
  i.country = ctrytem
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

i = Item.new
i.name = "Insect Spray"
i.ratio = 0
i.country = ctrytem
i.icon = "insect-repellent.svg"
i.category = 3
i.save


ctrytem2 = Country.find_by(name: "Namibia")
item.each do |it|
  i = Item.new
  i.name = it
  i.ratio = 0.9
  i.ratio = 0.3 if it == "Short"
  i.ratio = 0.3 if it == "Pullover"
  i.ratio = 0 if it == "Toilet bag"
  i.country = ctrytem2
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

i = Item.new
i.name = "Sunscreen"
i.ratio = 0
i.icon = "sunscreen.svg"
i.country = ctrytem2
i.category = 5
i.save

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

ctryvent = Country.find_by(name: "New Zealand")

eve = Event.new
eve.name = "Hobbiton"
eve.category = "Geek"
eve.remote_photo_url = "https://lelongweekend.com/wp-content/uploads/2018/04/nature-3245401_1920-1024x683.jpg"
eve.description = "One of the most popular attractions in Middle Earth, Hobbiton is also one of the most unique things to do in New Zealand!"
eve.start_date = "Thu, 20 August 2019"
eve.end_date = "Thu, 20 August 2019"
eve.country = ctryvent
eve.save

ev = Event.new
ev.name = "Boat trip at sunset"
ev.category = "Watersport"
ev.remote_photo_url = "https://images.unsplash.com/photo-1414437384035-787b9df782d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1408&q=80"
ev.description = "The water, the wind, the sun... What else?"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent
ev.save

ev = Event.new
ev.name = "Bungee Jumping"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://blog.buckitdream.com/wp-content/uploads/2017/11/jumpan-bungee-jumping-154639.jpg"
ev.description = " Said to be New Zealand’s most terrifying bungy, the Nevis Bungy Jump requires a 4WD journey and cable car ride to position you in the middle of the Nevis Valley in Queenstown."
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent
ev.save

ev = Event.new
ev.name = "Hike an Active Volcano"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://lelongweekend.com/wp-content/uploads/2018/04/new-zealand-3018634_1920-1024x669.jpg"
ev.description = "White Island can be seen letting off steam near the East Coast of the North Island. Tour boats or helicopters will get you up close to one of the most impressive geothermal sights in the country!"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent
ev.save

ev = Event.new
ev.name = "Swim with Dolphins"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://lelongweekend.com/wp-content/uploads/2018/04/dolphins-2137659_1920-1024x650.jpg"
ev.description = "Hector’s Dolphins are an endangered dolphin native to the South Island of New Zealand, a truly unforgettable experience!"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent
ev.save

ev = Event.new
ev.name = "New Zealand Winery"
ev.category = "Food"
ev.remote_photo_url = "https://lelongweekend.com/wp-content/uploads/2018/04/new-zealand-3018634_1920-1024x669.jpg"
ev.description = "Waiheke Island is a popular day trip from Auckland City - although the island’s beaches are noteworthy, it’s undoubtedly the award-winning wines grown here that draw visitors here!"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent
ev.save

ctryvent2 = Country.find_by(name: "Namibia")

ev = Event.new
ev.name = "Walk in the desert"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://images.unsplash.com/photo-1489493585363-d69421e0edd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
ev.description = "Try to picture a breathtaking sunset over and endless sea of sand..."
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent2
ev.save

e = Event.new
e.name = "Safari in Etosha National Park"
e.category = "Outdoor activities"
e.remote_photo_url = "https://images.unsplash.com/photo-1544219110-079476d43889?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1062&q=80"
e.description = "Etosha National Park is probably my number 1 thing to do in Namibia as it is one of the most incredible safari destinations on the planet with a wide variety of animals. Grab your camera and jump in!"
e.start_date = "Fri, 15 June 2019"
e.end_date = "Fri, 15 June 2019"
e.country = ctryvent2
e.save

e = Event.new
e.name = "Visit Kolmanskop"
e.category = "Cultural activities"
e.remote_photo_url = "https://cdn-images-1.medium.com/max/1600/1*YxnK-B4ftauz9CttHzN-Ig.jpeg"
e.description = "Kolmanskop is a ghost town in Sperregebiet National Park. Sperregebiet means the Forbidden Area, named because of the diamonds found there in the early 20th century."
e.start_date = "Fri, 15 June 2019"
e.end_date = "Fri, 15 June 2019"
e.country = ctryvent2
e.save

e = Event.new
e.name = "Meet the Himba People"
e.category = "Cultural activities"
e.remote_photo_url = "https://i.dailymail.co.uk/i/pix/2016/07/22/11/367EAAAA00000578-3703030-image-a-13_1469181716836.jpg"
e.description = "The Himba are semi-nomadic tribe and one of the most recognisable and traditional tribes in all of Africa, their ideal of beauty is inspired by the orange/red glow of the earth, something synonymous with the African continent."
e.start_date = "Fri, 15 June 2019"
e.end_date = "Fri, 15 June 2019"
e.country = ctryvent2
e.save

e = Event.new
e.name = "DEADVLEI & SOSSUSVLEI"
e.category = "Outdoor activities"
e.remote_photo_url = "https://images.unsplash.com/photo-1551176601-c55f81516ba9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1089&q=80"
e.description = "One of Namibia’s most iconic sights is the unique dead trees surrounded by red sand dunes… almost unreal!"
e.start_date = "Fri, 15 June 2019"
e.end_date = "Fri, 15 June 2019"
e.country = ctryvent2
e.save

e = Event.new
e.name = "Sandboarding on Dunes"
e.category = "Outdoor activities"
e.remote_photo_url = "https://blog.headout.com/wp-content/uploads/2018/03/Sandboarding-in-Dubai.jpg"
e.description = "If it’s adventure you are after then strap on a Namibian style snowboard and hit the sandy slopes!"
e.start_date = "Fri, 15 June 2019"
e.end_date = "Fri, 15 June 2019"
e.country = ctryvent2
e.save

ctryvent3 = Country.find_by(name: "Canada")

ev = Event.new
ev.name = "Forest walk"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://www.wedemain.fr/photo/art/grande/28623324-28127445.jpg?v=1544095128"
ev.description = "Will you dare face the dense and wild forest?"
ev.start_date = "Tue, 12 July 2019"
ev.end_date = "Tue, 12 July 2019"
ev.country = ctryvent3
ev.save

ev = Event.new
ev.name = "Boat trip at sunset"
ev.category = "Watersport"
ev.remote_photo_url = "https://images.unsplash.com/photo-1414437384035-787b9df782d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1408&q=80"
ev.description = "The water, the wind, the sun... What else?"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent3
ev.save

ev = Event.new
ev.name = "Swim with Dolphins"
ev.category = "Outdoor activities"
ev.remote_photo_url = "https://lelongweekend.com/wp-content/uploads/2018/04/dolphins-2137659_1920-1024x650.jpg"
ev.description = "Hector’s Dolphins are an endangered dolphin native to the South Island of New Zealand, a truly unforgettable experience!"
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.country = ctryvent3
ev.save

puts "Events created"
