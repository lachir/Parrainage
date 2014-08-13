class RemoveNumFromPgs < ActiveRecord::Migration
  def change
    remove_column :pgs, :num, :integer
  end
end
