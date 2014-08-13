class CreateManips < ActiveRecord::Migration
  def change
    create_table :manips do |t|
      t.string :nom
      t.string :lieu

      t.timestamps
    end
  end
end
