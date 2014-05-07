require 'RMagick'

class MagicInfo
  def populate(picture)
    raise 'No file path for image' unless picture.file_path
    begin
      img = Magick::Image::read(picture.file_path).first
    rescue Magick::ImageMagickError => e
      Rails.logger.error "an error has occured skipping"
    end
    picture.format = img.format
    picture.geometry = "#{img.columns}x#{img.rows}"
    picture.colors = img.number_colors
    picture.size = img.filesize
    picture.resolution = "#{img.x_resolution.to_i}x#{img.y_resolution.to_i} "+
      "pixels/#{img.units == Magick::PixelsPerInchResolution ?
      "inch" : "centimeter"}"
    if img.properties.length > 0
      img.properties.each do |name,value|
        picture.properties.create(name: name, value: value)
      end
    end
    picture.save!
  end
end
