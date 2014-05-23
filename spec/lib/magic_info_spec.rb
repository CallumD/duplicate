require 'spec_helper'

describe MagicInfo do
  describe '#populate', :needs_finddups => true do
    let(:file_sorter) { FileSorter.new(:file_path => 'spec/test_files') }

    before { file_sorter.copy_to_temp }
    after { FileUtils.rm_r(file_sorter.working_directory) }

    it 'populates an image with data' do
      MagicInfo.new.populate(Picture.first)
      populated_img = Picture.where(original_file_name: "GEDC0561.JPG").first
      expect(populated_img.format).to eq('JPEG')
      expect(populated_img.geometry).to eq('4608x3456')
      expect(populated_img.colors).to eq('184537')
      expect(populated_img.size).to eq('3943760')
      expect(populated_img.resolution).to eq('72x72 pixels/inch')
    end
  end
end
