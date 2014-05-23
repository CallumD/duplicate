class CreateFileSorter < ActiveRecord::Migration
  def change
    create_table :file_sorters do |t|
      t.string :file_path
      t.string :working_directory
    end
  end
end
