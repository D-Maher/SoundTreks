# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user_info = {
    provider: "spotify",
    uid: Faker::Lorem.word,
    name: Faker::Name.name,
    spotify_id: Faker::Lorem.word
    }
  User.create!(user_info)
end

10.times do
  location_info = {
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
    }
  Location.create!(location_info)
end

10.times do
  soundtrek_info = {
    description: Faker::Lorem.sentence,
    title: Faker::Lorem.word,
    trekker_id: (1..10).to_a.sample,
    location_id: (1..10).to_a.sample,
    playlist: Faker::Lorem.word,
    }
  SoundTrek.create!(soundtrek_info)
end

30.times do
  rating_info = {
    sound_trek_id: (1..10).to_a.sample,
    trekker_id: (1..10).to_a.sample,
    stars: (1..5).to_a.sample
    }
  Rating.create!(rating_info)
end




