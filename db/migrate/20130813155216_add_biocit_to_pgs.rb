class AddBiocitToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :biocit, :string
  end
end
