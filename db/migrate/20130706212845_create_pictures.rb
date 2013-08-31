class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file_name
      t.string :format
      t.string :geometry
      t.string :colors
      t.string :size
      t.string :resolution
      t.integer :duplicate_row_id

      t.timestamps
    end
  end
end
