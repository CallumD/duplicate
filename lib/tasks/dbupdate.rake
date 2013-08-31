namespace  :pics do
  desc "create the data and put it in the database"
  task :populate => :environment do
    system("findimagedupes -R /smb/N5200/photocopy/ > /var/tmp/dup.txt")
    DuplicateImagesParser.parse
    MagicInfo.populate
  end
  desc "populatates the image magic info on existing pictures"
  task :magic => :environment do
    MagicInfo.populate
  end
end
