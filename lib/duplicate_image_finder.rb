class DuplicateImageFinder
  attr_accessor :file_sorter

  def initialize(args)
    raise 'I cant work without a file_sorter please provide one' unless args[:file_sorter]
    self.file_sorter = args[:file_sorter]
  end
end

