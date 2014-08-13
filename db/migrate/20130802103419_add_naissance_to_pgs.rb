class AddNaissanceToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :naissance, :date
  end
end
