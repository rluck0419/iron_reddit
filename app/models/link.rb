class Link < ApplicationRecord
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  belongs_to :user
  belongs_to :board

  validates :title, presence: true
  validates :url, presence: true
  validates :user_id, presence: true
  validates :upvotes_count, presence: true
  validates :downvotes_count, presence: true
  validates :board_id, presence: true

  paginates_per 20

  # def self.top
  #   joins("left join votes on votes.link_id = links.id")
  #   .group("links.id, links.title")
  #   .order("count(votes.id) desc")
  # end
end
