class AddSondageidToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :sondage_id, :integer
  end
end
