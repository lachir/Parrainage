class CreateSondages < ActiveRecord::Migration
  def change
    create_table :sondages do |t|
      t.string :nom
      t.text :description
      t.integer :nbchoix
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
