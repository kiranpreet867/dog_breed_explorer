require "httparty"
require "faker"

Review.destroy_all
BreedImage.destroy_all
Breed.destroy_all

response = HTTParty.get("https://dog.ceo/api/breeds/list/all")
breeds = response["message"]

breeds.each do |breed_name, subbreeds|
  breed = Breed.create!(
    name: breed_name.capitalize,
    temperament: "Unknown"
  )

  image_response = HTTParty.get("https://dog.ceo/api/breed/#{breed_name}/images/random")

  if image_response["status"] == "success"
    BreedImage.create!(
      breed: breed,
      image_url: image_response["message"]
    )
  end

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
puts "Created #{BreedImage.count} images"
puts "Created #{Review.count} reviews"
