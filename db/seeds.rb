require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destorying the database..."
ClubSpecy.destroy_all
Species.destroy_all
Donation.destroy_all
Article.destroy_all
Club.destroy_all
User.destroy_all
puts "Database destroyed!"
puts "Creating the Users..."

users = []

30.times do
  users << User.create(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address)
end 
puts "Users created! Test: #{users.first.email}"


puts "Creating some Clubs"

category = ['medical', 'rescue', 'food', 'transportaion', 'educations']
clubs = []
users.each do |user|
  clubs << Club.create(user_id: user.id, name: Faker::FunnyName.name, description: "Wir helfen Hunden, die keiner mehr wollte. Hunde, die den Besitzern zu alt und zu krank wurden. Hunde, die misshandelt wurden. Mit deiner Hilfe möchten wir diesen armen Geschöpfen einen würdigen Lebensabend mit viel Liebe ermöglichen.", address: Faker::Address.street_address, category: category.sample, instagram_link: "www.instagram.com", facebook_link: "www.facebook.com", website_link: "www.google.com")
end
puts "Clubs created Test: #{clubs.first.name}"


puts "creating Donations"

users.each do |user|
    Donation.create(amount: rand(0..45).to_f, user_id: user.id, club_id: clubs[rand(1...30)].id )
end
puts "Donations created"


puts "create Species"

animal_species = ['dogs', 'cats', 'dolphins', 'dinasaurs', 'elephants', 'birds', 'wolfs', 'panda', 'raccon']
species = []
animal_species.each do |specie|
  species << Species.create(name: specie)
end
puts "Species done"


puts "create Club Species"

clubs.each do |club|
  2.times do
    ClubSpecy.create(club_id: club.id, species_id: species[rand(0..species.size - 1)].id)
  end
end
puts "Club Species created"


puts "Creating Articles..."

clubs.each do |club|
  rand(2..4).times do
    Article.create(title: "Nine reasons to fight for a global wildlife trade ban", description: "We’re calling for an end to the cruel global wildlife trade – to prevent animal suffering, protect our planet and help prevent further zoonotic disease outbreaks like COVID-19. But we can’t do it without you", club_id: club.id)
  end
end
puts "Articles created!"

puts "Seeds complete!"