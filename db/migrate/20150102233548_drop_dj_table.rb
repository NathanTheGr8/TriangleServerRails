class DropDjTable < ActiveRecord::Migration
  def change
  	drop_table :djs
  end
end
