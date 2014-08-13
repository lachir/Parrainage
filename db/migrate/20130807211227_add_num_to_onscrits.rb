class AddNumToOnscrits < ActiveRecord::Migration
  def change
    add_column :onscrits, :num, :integer
  end
end
