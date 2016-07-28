class AddUpAndDownToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :up_vote, :boolean, default: false
    add_column :votes, :down_vote, :boolean, default: false
  end
end
