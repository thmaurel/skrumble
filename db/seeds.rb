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

ct = ["France", "Germany", "Australia", "USA", "New Zealand", "Brasil", "Canada", "South Africa", "Japan", "Mauricius"]
pic = ["https://study-eu.s3.amazonaws.com/uploads/image/path/97/wide_fullhd_france-paris-eiffel-tower.jpg",
  "https://www.weekend-evasion.fr/wp-content/uploads/2014/11/Cath%C3%A9drale-de-Cologne.jpg",
  "https://www.voyageavecnous.fr/wp-content/uploads/2018/10/quel-visa-pour-australie.jpg",
  "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.travelandleisure.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F1600x1000%2Fpublic%2F1551194229%2Fgrand-canyon-south-rim-19-GRANDCANYON0219.jpg%3Fitok%3DpXzOkx5_&q=85",
  "https://destination-nouvellezelande.com/wp-content/uploads/2018/02/incontournable-nouvelle-zelande.jpg",
  "https://www.tribudexplorateurs.com/wp-content/uploads/2018/11/voyage-bresil-famille-rio-1.jpg",
  "https://www.voyagetips.com/wp-content/uploads/2018/01/yukon-canada.jpg",
  "https://lonelyplanetimages.imgix.net/mastheads/stock-photo-welcome-to-cape-town-104168527.jpg?sharp=10&vib=20&w=1200",
  "https://www.readytogo.fr/files/fichepays/Japon_1469092036_shutterstock_242376076-min.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2KPXDyYwXWvJ2WkloJ566PenrKdmpfTR3RziyAKj5Whgyx36JHw"
]


ct.each_with_index do |name, i|
  c = Country.new
  c.name = name
  c.remote_photo_url = pic[i]
  c.save
end

puts "Countries created"

t = Trip.new
t.start_date = "Fri, 24 May 2019"
t.end_date = "Fri, 24 May 2020"
t.country_id = 1
t.user_id = 1
t.save

puts "Trip created"

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
