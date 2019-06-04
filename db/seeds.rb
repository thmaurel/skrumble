# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.destroy_all
Item.destroy_all
Country.destroy_all
User.destroy_all

u = User.new
u.name = "Bob"
u.surname = "Bob"
u.username = "Bob"
u.email = "abc@gmail.com"
u.password = "abc123"
u.password_confirmation = "abc123"
u.save

puts "User created"

ct = ["France", "Germany", "Australia", "USA", "New Zealand", "Brasil", "Canada", "South Africa", "Japan", "Mauricius"]

ct.each do |name|
  c = Country.new
  c.name = name
  c.save
end

puts "Countries created"

item = ["t-shirts", "shorts", "chaussettes", "slips", "pulls"]

item.each do |it|
  i = Item.new
  i.name = it
  i.ratio = 1
  i.ratio = 0.3 if it == "pulls"
  i.save
end

tasks = ["visa", "passeport", "vaccin fievre jaune", "medicament paludisme"]

Country.all.each do |count|
  tasks.each do |t|
    ta = Task.new
    ta.name = t
    ta.country = count
    ta.save
  end
end

t = Trip.new
t.start_date = "Fri, 24 May 2019"
t.end_date = "Fri, 24 May 2020"
t.country_id = 1
t.user_id = 1
t.save

puts "Trip created"
