class AddDatetimeToManips < ActiveRecord::Migration
  def change
    add_column :manips, :date, :datetime
  end
end
