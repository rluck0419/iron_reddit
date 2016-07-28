class Downvote < ApplicationRecord
  belongs_to :user
  belongs_to :link, counter_cache: true

  validates :user_id, presence: true
  validates :link_id, presence: true
end
