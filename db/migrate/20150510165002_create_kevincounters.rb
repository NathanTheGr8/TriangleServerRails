class CreateKevincounters < ActiveRecord::Migration
  def change
    create_table :kevincounters do |t|

      t.timestamps null: false
    end
  end
end
