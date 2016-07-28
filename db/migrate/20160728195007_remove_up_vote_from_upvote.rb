class RemoveUpVoteFromUpvote < ActiveRecord::Migration[5.0]
  def change
    remove_column :upvotes, :up_vote, :boolean
    remove_column :upvotes, :down_vote, :boolean
  end
end
