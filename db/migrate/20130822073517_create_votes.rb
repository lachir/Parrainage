class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :priorite
      t.integer :pg_id
      t.integer :onscrit_id

      t.timestamps
    end
    add_index :votes, :pg_id
    add_index :votes, :onscrit_id
  end
end
