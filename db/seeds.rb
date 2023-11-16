# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

5.times do
  author = Author.create(
    name: Faker::Name.name,
    date_of_birth: Faker::Date.between(from: '1900-01-01', to: '2000-01-01')
  )

  author.books << Book.create(
    title: Faker::Book.title,
    year_published: Faker::Date.between(from: '1900-01-01', to: '2022-01-01').year,
    pages: rand(100..500)
  )
end

p "created #{Author.count} authors and #{Book.count} books"
