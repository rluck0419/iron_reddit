class Link < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :url, presence: true
  paginates_per 20

  def self.top
    joins("left join votes on votes.link_id = links.id")
    .group("links.id, links.title")
    .order("count(votes.id) desc")
  end
end
