class AddFullNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first, :string
  	add_column :users, :middle, :string
  	add_column :users, :last, :string
  	add_column :users, :initals, :string
  end
end
