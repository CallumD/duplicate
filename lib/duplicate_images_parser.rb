class  DuplicateImagesParser
  def self.parse
    file = File.new("/var/tmp/dup.txt", "r")
    row_number = 1
    DuplicateRow.delete_all
    ActiveRecord::Base.transaction do
      while (line = file.gets)
        row = DuplicateRow.create(row_number: row_number, resolved: false)
        file_names = line.split(' ')
        file_names.each do |file_name|
          picture = Picture.find_or_create_by_file_name(file_name)
          picture.update_attributes(duplicate_row: row)
          puts file_name
        end
        row_number += 1
      end
    end
    file.close
  end
end
