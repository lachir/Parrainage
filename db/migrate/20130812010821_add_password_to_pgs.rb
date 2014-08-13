class AddPasswordToPgs < ActiveRecord::Migration
  def change
    add_column :pgs, :password_digest, :string
  end
end
