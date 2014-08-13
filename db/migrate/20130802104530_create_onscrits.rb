class CreateOnscrits < ActiveRecord::Migration
  def change
    create_table :onscrits do |t|
      t.string :nom
      t.string :prenom
      t.date :naissance
      t.integer :prepa_id

      t.timestamps
    end

    add_index :onscrits, :prepa_id
  end
end
