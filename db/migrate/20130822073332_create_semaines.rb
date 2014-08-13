class CreateSemaines < ActiveRecord::Migration
  def change
    create_table :semaines do |t|
      t.string :nom
      t.text :description
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
