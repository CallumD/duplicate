class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file_name
      t.string :original_file_name
      t.string :format
      t.string :geometry
      t.string :colors
      t.string :size
      t.string :resolution

      t.timestamps
    end
  end
end
