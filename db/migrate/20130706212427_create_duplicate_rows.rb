class CreateDuplicateRows < ActiveRecord::Migration
  def change
    create_table :duplicate_rows do |t|
      t.integer :row_number
      t.boolean :resolved

      t.timestamps
    end
  end
end
