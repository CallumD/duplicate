require 'RMagick'

class MagicInfo
  def self.populate
    Picture.where(geometry: nil).map do |pic|
       puts "Getting info for for #{pic.file_name}"
       file = pic.file_name
       begin
       img = Magick::Image::read(file).first
       rescue Magick::ImageMagickError => e
         puts "an error has occured skipping"
         next
       end
       #pic.format = img.format
       pic.geometry = "#{img.columns}x#{img.rows}"
       #pic.colors = img.number_colors
       #pic.size = img.filesize
       #pic.resolution = "#{img.x_resolution.to_i}x#{img.y_resolution.to_i} "+
       #    "pixels/#{img.units == Magick::PixelsPerInchResolution ?
       #    "inch" : "centimeter"}"
       #if img.properties.length > 0
       #    img.properties { |name,value|
       #        pic.properties.create(name: name, value: value)
       #    }
       #end
       pic.save
       puts Picture.where(geometry: nil).count
    end
  end
end
