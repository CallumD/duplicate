class AddPathsToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.string :file_path
      t.string :original_file_path
    end
  end
end
