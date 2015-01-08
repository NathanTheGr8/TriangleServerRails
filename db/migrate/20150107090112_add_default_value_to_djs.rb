class AddDefaultValueToDjs < ActiveRecord::Migration
  def change
  	change_column :djs, :monday, :string, :default => nil
  	change_column :djs, :tuesday, :string, :default => nil
  	change_column :djs, :wednesday, :string, :default => nil
  	change_column :djs, :thursday, :string, :default => nil
  	change_column :djs, :friday, :string, :default => nil
  	change_column :djs, :saturday, :string, :default => nil
  	change_column :djs, :sunday, :string, :default => nil
  end
end
