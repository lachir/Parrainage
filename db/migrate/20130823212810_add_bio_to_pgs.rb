class AddBioToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :bio, :string
  end
end
