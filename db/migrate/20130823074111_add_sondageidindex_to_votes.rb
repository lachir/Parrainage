class AddSondageidindexToVotes < ActiveRecord::Migration
  def change
    add_index :votes, :sondage_id
  end
end