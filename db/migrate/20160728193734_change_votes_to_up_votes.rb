class ChangeVotesToUpVotes < ActiveRecord::Migration[5.0]
  def change
    rename_table :votes, :upvotes
  end
end
