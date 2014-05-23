class FileSorter < ActiveRecord::Base
  after_initialize do |user|
    self.working_directory = "/tmp/#{SecureRandom.uuid}/"
    Dir.mkdir(working_directory)
  end

  def populate_duplicates
    system("findimagedupes -R -q #{working_directory} > #{dup_file_path}")
  end

  def dup_file_path
  "#{working_directory}dup.txt"
  end

  def files
    Dir.glob("#{file_path}/**/*").reject { |fn| File.directory?(fn) }
  end

  def copy_to_temp
    files.each do |file|
      file_name = File.basename(file, File.extname(file))
      extension = File.extname(file)
      new_file_name = "#{SecureRandom.uuid}#{extension.downcase}"
      new_file_path = "#{self.working_directory}#{new_file_name}"
      FileUtils.cp(file, new_file_path)
      Picture.create!({
        file_name:          new_file_name,
        file_path:          new_file_path,
        original_file_name: "#{file_name}#{extension}",
        original_file_path: file
      })
    end
  end
end
