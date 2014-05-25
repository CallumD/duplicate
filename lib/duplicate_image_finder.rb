class DuplicateImageFinder
  attr_accessor :file_sorter

  def initialize(args)
    self.file_sorter = FileSorter.new(file_path: args[:path])
  end

  def process
    file_sorter.copy_to_temp
    file_sorter.populate_duplicates
    DuplicateImagesParser.parse(file_sorter.dup_file_path)
  end
end

