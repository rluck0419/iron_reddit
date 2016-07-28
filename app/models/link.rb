class Link < ApplicationRecord
  has_many :upvotes
  has_many :downvotes
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
  validates :user_id, presence: true

  paginates_per 20

  # def self.top
  #   joins("left join votes on votes.link_id = links.id")
  #   .group("links.id, links.title")
  #   .order("count(votes.id) desc")
  # end
end
