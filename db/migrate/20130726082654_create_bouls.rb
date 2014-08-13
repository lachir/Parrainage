class CreateBouls < ActiveRecord::Migration
  def change
    create_table :bouls do |t|
      t.string :nom

      t.timestamps
    end
  end
end
