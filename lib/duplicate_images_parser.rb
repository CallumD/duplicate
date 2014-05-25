class  DuplicateImagesParser
  def self.parse(path)
    file = File.new(path, "r")
    row_number = 1
    DuplicateRow.delete_all(:file_path => path)
    ActiveRecord::Base.transaction do
      while (line = file.gets)
        row = DuplicateRow.create(row_number: row_number, resolved: false, file_path: path)
        file_paths = line.split
        file_paths.each do |file_path|
          picture = Picture.find_or_create_by(:file_path => file_path)
          picture.update_attributes(duplicate_row: row)
        end
        row_number += 1
      end
    end
    file.close
  end
end
