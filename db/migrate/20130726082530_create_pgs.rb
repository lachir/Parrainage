class CreatePgs < ActiveRecord::Migration
  def change
    create_table :pgs do |t|
      t.string :nom
      t.string :prenom
      t.string :bucque
      t.string :fam
      t.integer :num
      t.boolean :saque
      t.text :bio
      t.integer :boul_id
      t.integer :prepa_id

      t.timestamps
    end
    add_index :pgs, :boul_id
    add_index :pgs, :prepa_id
  end
end
