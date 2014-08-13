class RemoveBioFromPgs < ActiveRecord::Migration
  def change
    remove_column :pgs, :bio, :text
  end
end
