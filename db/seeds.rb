# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all


10.times do 
	City.create!(
	name: Faker::Address.city,
	zip_code: Faker::Address.zip_code
	)
end 

10.times do 
	User.create!(
	first_name: Faker::Name.first_name, 
	last_name: Faker::Name.last_name,
	description: Faker::GreekPhilosophers.quote,
	email: Faker::Internet.email,
	age: rand(18..70),
	password: Faker::String.random(length: 6),
	city_id: rand(City.first.id..City.last.id)
	)
end 

20.times do 
	Gossip.create!(
	title: Faker::Lorem.sentence(word_count: 1), 
	content: Faker::ChuckNorris.fact, 
	user_id: rand(User.first.id..User.last.id)
	)
end 

10.times do 
	Tag.create!(
	title: Faker::Book.genre 
	)
end 

20.times do 
	JoinTableGossipTag.create!(
	gossip_id: rand(Gossip.first.id..Gossip.last.id), 
	tag_id: rand(Tag.first.id..Tag.last.id)
	)
end 

10.times do
	PrivateMessage.create!(
		content: Faker::Movies::StarWars.quote,
		sender_id: rand(User.first.id..User.last.id),
		recipient_id:  rand(User.first.id..User.last.id)
		)
end


puts "Fake data initialized"