require "httparty"
require "faker"

Breed.destroy_all
BreedImage.destroy_all
Review.destroy_all

response = HTTParty.get("https://dog.ceo/api/breeds/list/all")
breeds = response["message"]

breeds.each do |breed_name, subbreeds|
  breed = Breed.create!(
    name: breed_name.capitalize,
    temperament: "Unknown"
  )

  3.times do
    Review.create!(
      breed: breed,
      reviewer_name: Faker::Name.name,
      rating: rand(1..5),
      comment: Faker::Lorem.sentence
    )
  end
end

puts "Created #{Breed.count} breeds"
puts "Created #{Review.count} reviews"
