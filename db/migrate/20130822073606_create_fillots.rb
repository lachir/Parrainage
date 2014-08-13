class CreateFillots < ActiveRecord::Migration
  def change
    create_table :fillots do |t|
      t.integer :pg_id
      t.integer :onscrit_id
      t.integer :semaine_id

      t.timestamps
    end
    add_index :fillots, :pg_id
    add_index :fillots, :onscrit_id
    add_index :fillots, :semaine_id
  end
end
