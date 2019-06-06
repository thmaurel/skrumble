# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Todo.destroy_all
# TripItem.destroy_all
# Trip.destroy_all
# Item.destroy_all
# Task.destroy_all
# Country.destroy_all
# User.destroy_all

# u = User.new
# u.name = "Bob"
# u.surname = "Bob"
# u.username = "Bob"
# u.email = "abc@gmail.com"
# u.password = "abc123"
# u.password_confirmation = "abc123"
# u.save

# puts "User created"

# ct = ["France", "Germany", "Australia", "USA", "New Zealand", "Brasil", "Canada", "South Africa", "Japan", "Mauricius"]

# ct.each do |name|
#   c = Country.new
#   c.name = name
#   c.save
# end

# puts "Countries created"

# item = ["t-shirts", "shorts", "chaussettes", "slips", "pulls"]

# item.each do |it|
#   i = Item.new
#   i.name = it
#   i.ratio = 1
#   i.ratio = 0.3 if it == "pulls"
#   i.save
# end

# tasks = ["visa", "passeport", "vaccin fievre jaune", "medicament paludisme"]

# Country.all.each do |count|
#   tasks.each do |t|
#     ta = Task.new
#     ta.name = t
#     ta.country = count
#     ta.save
#   end
# end

# t = Trip.new
# t.start_date = "Fri, 24 May 2019"
# t.end_date = "Fri, 24 May 2020"
# t.country_id = 1
# t.user_id = 1
# t.save

# puts "Trip created"

# CSV.foreach('countries.csv') do |row|
#   c = Country.new
#   c.name = row[0]
#   c.save
# end

# html = open("https://www.diplomatie.gouv.fr/fr/conseils-aux-voyageurs/conseils-par-pays-destination/").read
# html_doc = Nokogiri::HTML(html)
# html_doc.search('#recherche_pays option').each do |ct|
#   puts '"' + ct.text + '", "' + ct.values[0] + '"'
#   c = Country.new
#   c.name = ct.text
#   c.save
# end

CSV.foreach('countries.csv') do |row|
  name = row[0]
  link = "https://www.diplomatie.gouv.fr/" + row[1]
  dtp = 0
  html = open(link).read
  html_doc = Nokogiri::HTML(html)
  html_doc.search('#sante p').each do |text|
    if (text.text.include? "diphtérie") && (text.text.include? "obligatoire")
      dtp = 1
    elsif (text.text.include? "diphtérie") && (text.text.include? "recommandé")
      dtp = 2
    end
  end
  if dtp == 1
    puts name + " : DTP obligatoire"
  elsif dtp == 2
    puts name + " : DTP recommandé"
  else
    puts name + " : DTP non nécessaire"
  end
end
