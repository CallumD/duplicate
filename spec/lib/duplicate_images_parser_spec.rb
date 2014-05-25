require 'spec_helper'

describe DuplicateImagesParser do
  before(:all) do
    @test_file = Tempfile.new('test_parser')
    @test_file.write("file_name_1.jpg file_name_2.jpg\n")
    @test_file.write("file_name_3.jpg file_name_4.jpg\n")
    @test_file.close
  end

  after(:all) do
    @test_file.close
    @test_file.unlink
  end

  describe '.parse' do
    before do
      DuplicateImagesParser.parse(@test_file.path)
    end

    it 'creates duplicate rows for each line in the file' do
      expect(DuplicateRow.where(:file_path => @test_file.path).count).to eq(2)
    end

    it 'creates an image if there is not already one' do
      expect(Picture.find_by(:file_path => 'file_name_3.jpg')).not_to be_nil
    end

    it 'correctly links the file to the duplicate row' do
      expect(Picture.find_by(:file_path => 'file_name_3.jpg').duplicate_row.row_number).to eq(2)
      expect(Picture.find_by(:file_path => 'file_name_1.jpg').duplicate_row.row_number).to eq(1)
    end
  end
end
