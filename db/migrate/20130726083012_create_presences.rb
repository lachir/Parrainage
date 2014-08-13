class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.integer :manip_id
      t.integer :pg_id

      t.timestamps
    end
    add_index :presences, :manip_id
    add_index :presences, :pg_id

  end
end
