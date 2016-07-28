# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  board = Board.create!(name: Faker::Hacker.noun)
  user = User.create!(email: "user#{i+1}@example.com", password: "password")
  10.times do
    link = Link.create!(title: Faker::Name.name, url: "www.#{Faker::Name.name.downcase.gsub(/[. ']/, '')}.com", user: user, board: board)
    10.times do
      if rand > 0.5
        Upvote.create!(user_id: user.id, link_id: link.id)
      else
        Downvote.create!(user_id: user.id, link_id: link.id)
      end
    end
  end
end
