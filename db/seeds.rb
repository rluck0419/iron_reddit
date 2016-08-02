# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BOARDS = ["art", "movies", "music", "computers", "games", "omg", "wow", "yolo", "thuglife", "funny"]
BAIT = ["You'll Never Guess Which", "The Top 10", "Click Here to See", "You'd Never Believe"]
SUBJ = ["Celebs", "Billionares", "Illuminati", "Entrepreneurs", "New Age Retro Hippies", "Cranky Ladies"]
ACT = ["Spy", "Drink", "Eat", "Smoke", "Gamble"]
PRED = ["On Each Other", "Way Too Much", "With Death", "Behind Each Other's Back"]

URLS = ["clickybait", "listicles-please", "timewaster", "scuttlebutt-daily", "grapevine-report", "scandalist"]

10.times do |i|
  board = Board.create!(name: BOARDS[i])
  user = User.create!(email: "user#{i+1}@example.com", password: "password")

  20.times do
    link = Link.create!(title: "#{BAIT.sample} #{SUBJ.sample} #{ACT.sample} #{PRED.sample}", url: "www.#{URLS.sample}.com/trash/#{rand(500).round}", user: user, board: board)

    50.times do
      if rand > 0.5
        Upvote.create!(user_id: user.id, link_id: link.id)
      else
        Downvote.create!(user_id: user.id, link_id: link.id)
      end
    end
  end
end
