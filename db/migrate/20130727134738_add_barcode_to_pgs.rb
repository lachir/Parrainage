class AddBarcodeToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :barcode, :string
  end
end
