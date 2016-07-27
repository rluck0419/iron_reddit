class Link < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :url, presence: true
end
