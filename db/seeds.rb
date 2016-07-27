# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

40.times do |i|
  link = Link.create!(title: Faker::Name.name, url: "www.#{Faker::Name.name.downcase.gsub(/[. ']/, '')}.com")
  rand(1..5).times do
    Vote.create!(link: link)
  end
end