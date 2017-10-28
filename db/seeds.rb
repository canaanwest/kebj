# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

LOVES_FILE = Rails.root.join('db', 'loves_seeds.csv')
puts "Loading raw user data from #{LOVES_FILE}"

user_failures = []
CSV.foreach(LOVES_FILE, :headers => true) do |row|
  love = Love.new
  love.id = row['id']
  love.love = row['title']
  love.description = row['description']
  puts "Created user: #{love.inspect}"
  successful = love.save
  if !successful
    user_failures << love
  end
end




REVIEWS_FILE = Rails.root.join('db', 'reviews_seeds.csv')
puts "Loading raw user data from #{REVIEWS_FILE}"

user_failures = []
CSV.foreach(REVIEWS_FILE, :headers => true) do |row|
  review = Review.new
  review.id = row['id']
  review.text = row['text']
  review.name = row['name']
  review.relationship = row['relationship']
  review.rating = row['rating']

  puts "Created user: #{review.inspect}"
  successful = review.save
  if !successful
    user_failures << review
  end
end



puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"
