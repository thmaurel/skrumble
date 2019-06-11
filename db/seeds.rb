# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all
TripItem.destroy_all
Trip.destroy_all
Item.destroy_all
Task.destroy_all
Country.destroy_all
User.destroy_all

u = User.new
u.first_name = "Emeric"
u.last_name = "Le Bail"
#u.username = "Bob"
u.email = "abc@gmail.com"
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

item = ["Pullovers", "Shorts", "Socks", "T-shirts", "Underwears", "Toilet bag"]

item.each do |it|
  i = Item.new
  i.name = it
  i.ratio = 1
  i.ratio = 0.3 if it == "Pullovers"
  i.ratio = 0 if it == "Toilet bag"
  i.save
end

puts "Items created"

# tasks = ["visa", "passeport", "vaccin fievre jaune", "medicament paludisme"]

taco = Country.find_by(name: "North Korea")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Rabies vaccine"
ta.country = taco
ta.save

taco = Country.find_by(name: "Indonesia")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.save
ta.name = "Dengue vaccine"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Typhoid vaccine"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.save

taco = Country.find_by(name: "New Zealand")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.save

taco = Country.find_by(name: "Namibia")
ta = Task.new
ta.name = "Passport"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Visa"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Yellow fever vaccine"
ta.country = taco
ta.save
ta = Task.new
ta.name = "Typhoid vaccine"
ta.country = taco
ta.save

puts "Tasks created"

ev = Event.new
ev.name = "Scuba diving"
ev.remote_photo_url = "https://nature-plongee.com/wp-content/uploads/voyage-plongee-saba-caraibes-m-j41.jpg"
ev.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, dicta ea excepturi cumque, corporis mollitia incidunt maxime consequatur distinctio dolore."
ev.start_date = "Fri, 24 May 2019"
ev.end_date = "Fri, 24 May 2019"
ev.trip_id = 47
ev.save

# Country.all.each do |count|
#   tasks.each do |t|
#     ta = Task.new
#     ta.name = t
#     ta.country = count
#     ta.save
#   end
# end


# html = open("https://www.diplomatie.gouv.fr/fr/conseils-aux-voyageurs/conseils-par-pays-destination/").read
# html_doc = Nokogiri::HTML(html)
# html_doc.search('#recherche_pays option').each do |ct|
#   puts '"' + ct.text + '", "' + ct.values[0] + '"'
#   c = Country.new
#   c.name = ct.text
#   c.save
# end

# CSV.foreach('countries.csv') do |row|
#   name = row[0]
#   link = "https://www.diplomatie.gouv.fr/" + row[1]
#   fj = 0
#   html = open(link).read
#   html_doc = Nokogiri::HTML(html)
#   html_doc.search('#sante p').each do |text|
#     if (text.text.include? "fièvre jaune")
#       fj = 1
#     end
#   end
#   if fj == 1
#     puts name + " : Fièvre Jaune todo"
#   else
#     puts name + " : Fièvre Jaune not todo"
#   end
# end


