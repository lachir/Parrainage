class CreatePrepas < ActiveRecord::Migration
  def change
    create_table :prepas do |t|
      t.string :nom
      t.string :ville

      t.timestamps
    end
  end
end
