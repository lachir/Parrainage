class AddTelToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :tel, :string
  end
end
