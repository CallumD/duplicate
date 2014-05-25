class Picture < ActiveRecord::Base
  has_many :properties
  belongs_to :duplicate_row

  def thumb_path
    file_path.gsub(file_name, "thumb/#{file_name}")
  end
end
