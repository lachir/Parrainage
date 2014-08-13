class AddLevelToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :level, :integer
  end
end
