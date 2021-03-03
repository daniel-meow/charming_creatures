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
users << User.create(email: "seb@lewagon.org",password: "123456", address: "Tempelhofer Strasse 5", goal: "125.75" )
users << User.create(email: "timo@home.org", password: "123456", address: "Samsungweg 78", goal: "326.89" )
users << User.create(email: "winnie@puh.org", password: "123456", address: "Honigweg 7", goal: "425.56" )
puts "Users created! Test: #{users.first.email}"

puts "Creating some Clubs"

clubs = []

clubs << Club.create(user_id: users[0].id, name: "A Better Place", description: "Wir helfen Hunden, die keiner mehr wollte. Hunde, die den Besitzern zu alt und zu krank wurden. Hunde, die misshandelt wurden. Mit deiner Hilfe möchten wir diesen armen Geschöpfen einen würdigen Lebensabend mit viel Liebe ermöglichen.", address: "Gutstrasse 31", category: ["rescue", "food"], instagram_link: "www.instagram.com", facebook_link: "www.facebook.com", website_link: "www.google.com")
clubs << Club.create(user_id: users[1].id, name: "HelpDotOrg", description: "Wir wollen mit unserem Projekt DAGI DOG in Dagestans Hauptstadt Machatschkala aktiv helfen, in Form eines umfassenden Kastrationsprogramms und der Pflege verletzter Tiere in einem dafür bereits angemieteten Haus.", address: "Gutstrasse 31", category: ["rescue", "food"], instagram_link: "www.instagram.com", facebook_link: "www.facebook.com", website_link: "www.google.com")
clubs << Club.create(user_id: users[2].id, name: "Mamma's 4 Kitties", description: "Warum brauchen die Tiere in Dagestan unsere Hilfe?
Die russische Republik Dagestan liegt idyllisch zwischen zwei Meeren, die Hauptstadt ist Machatschkala. Von dieser in Russland doch noch relativ neuen Sache namens „Tierschutz” haben hier leider noch nicht so viele Leute etwas gehört. Es gibt kein Tierheim, nicht einmal ein Staatliches. Überall laufen Straßentiere herum und vermehren sich unkontrolliert. Man schätzt ihren Bestand auf mindestens 200.000 Hunde und Katzen. Es gibt keine Kastrationsprogramme, nur Vergiftungsaktionen. Besonders an den Bahnhöfen wimmelt es von Tieren, da hier Reisende vorbei kommen und ab und zu ihr Essen teilen. So dicht an den Gleisen kommt es ständig zu Unfällen. Hunde und Katzen mit fehlenden Gliedmaßen anzutreffen, ist hier Usus. Natürlich gibt es auch einzelne Tierschützer, die sich seit Jahren vor Ort engagieren und ihr letztes Hemd den Tieren geben. Aber ohne Unterstützung der Bevölkerung, des Staates oder einer großen Organisation kommen sie nicht weit. Wenn die Tiere kaum jemanden in der Bevölkerung interessieren, spendet auch niemand. „Tierschutz” ist hier noch ein relativ neuer Trend, von dem noch keiner so recht weiß, ob er ihn mitmachen will.", address: "Gutstrasse 31", category: ["rescue", "food"], instagram_link: "www.instagram.com", facebook_link: "www.facebook.com", website_link: "www.google.com")
puts "Clubs created Test: #{clubs.first.name}"

puts "creating Donations"

users.each do |user|
  3.times do
    Donation.create(amount: rand(0..45).to_f, user_id: user.id, club_id: clubs[rand(0...2)].id )
  end
end

puts "Donations created"

puts "create Species"

animalspecies = []

9.times do
  animalspecies << Species.create(name: Faker::Creature::Animal.name )
end
puts "Species done"

puts "create Club Species"

clubs.each do |club|
  2.times do
    ClubSpecy.create(club_id: club.id, species_id: animalspecies[rand(0..animalspecies.size - 1)].id)
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