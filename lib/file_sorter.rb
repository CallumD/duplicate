require 'securerandom' 

puts "Renaming files..."

folder_path = "photocopy/"
Dir.glob(folder_path + "**/*").reject { |fn| File.directory?(fn) }.each do |f|
  filename = File.basename(f, File.extname(f))
  extension = File.extname(f).downcase
  File.rename(f, folder_path + SecureRandom.uuid + extension)
end

puts "Renaming complete."
