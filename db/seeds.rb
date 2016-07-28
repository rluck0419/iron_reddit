# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


40.times do |i|
  user = User.create!(email: "user#{i+1}@example.com", password: "password")
  link = Link.create!(title: Faker::Name.name, url: "www.#{Faker::Name.name.downcase.gsub(/[. ']/, '')}.com", user: user)

  rand(1..5).times do
    up = false
    down = false

    if rand > 0.5
      up = true
    else
      down = true
    end

    Vote.create!(user_id: user.id, link: link, up_vote: up, down_vote: down)
  end
end
