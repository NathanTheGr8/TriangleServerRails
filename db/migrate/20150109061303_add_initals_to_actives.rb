class AddInitalsToActives < ActiveRecord::Migration
  def change
  	add_column :actives, :initials, :string
  end
end
