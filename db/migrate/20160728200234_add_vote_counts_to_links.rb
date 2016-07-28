class AddVoteCountsToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :upvotes_count, :integer, default: 0
    add_column :links, :downvotes_count, :integer, default: 0
  end
end
