require 'spec_helper'

describe FileSorter do
  FILE_PATH = 'spec/test_files'

  let(:file_sorter) { FileSorter.new(file_path: FILE_PATH) }

  it 'finds all the test files' do
    expect(file_sorter.files.count).to eq(6)
  end

  it 'creates a folder in the temp directory for working with' do
    random = SecureRandom.uuid
    SecureRandom.stub(:uuid) { random }
    expect(file_sorter.working_directory).to eq("/tmp/#{random}/")
  end

  context 'copies the originals into the temp directory' do
    after do
      FileUtils.rm_r(file_sorter.working_directory)
    end

    it 'has no files in the working dir to begin with' do
      expect(Dir.glob("#{file_sorter.working_directory}/**").count).to eq(0)
    end

    it 'has copies of the originals in there' do
      file_sorter.copy_to_temp
      expect(Dir.glob("#{file_sorter.working_directory}/**").count).to eq(6)
    end
  end

  it 'keeps track of the original file names' do
    file_sorter.copy_to_temp
    expect(Picture.all.map(&:original_file_name)).to eq(file_sorter.files.map { |f| f.split('/').last })
  end

  it 'keeps track of the original and new path' do
    file_sorter.copy_to_temp
    expect(Picture.all.map(&:original_file_path)).to eq(file_sorter.files)
  end
end
