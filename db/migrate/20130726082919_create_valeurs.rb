class CreateValeurs < ActiveRecord::Migration
  def change
    create_table :valeurs do |t|
      t.integer :manip_id
      t.integer :boul_id
      t.integer :point

      t.timestamps
    end
    add_index :valeurs, :manip_id
    add_index :valeurs, :boul_id
  end
end
