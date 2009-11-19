xml.instruct!
xml.property do
  xml.images do
     @property.gallery.uploads.each do |upload|
         xml.image do
           xml.thumb upload.photo.url(:thumb).to_s
           xml.pagesize upload.photo.url(:pagesize).to_s
         end
    end
  end
end
