class AddCommentToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :comment, :string
  end
end
