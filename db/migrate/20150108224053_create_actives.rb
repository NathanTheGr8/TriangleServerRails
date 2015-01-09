class CreateActives < ActiveRecord::Migration
  def change
    create_table :actives do |t|
      t.string :first
      t.string :middle
      t.string :last
      t.integer :phone
      t.string :email
      t.string :year
      t.string :major
      t.string :pledgeclass
      t.boolean :inhouse

      t.timestamps null: false
    end
  end
end
