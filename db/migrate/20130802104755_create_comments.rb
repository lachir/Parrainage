class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :pg_id
      t.integer :onscrit_id

      t.timestamps
    end

    add_index :comments, :pg_id
    add_index :comments, :onscrit_id
  end
end
