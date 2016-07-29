class Board < ApplicationRecord
  has_many :links, dependent: :destroy

  paginates_per 5

  validates :name, presence: true
end
