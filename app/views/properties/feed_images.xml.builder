xml.instruct!
	if @property.gallery
		xml.images do
			 @property.gallery.uploads.each do |upload|
				 xml.image  upload.photo.url(:pagesize).to_s, "path"=>upload.photo.url(:thumb).to_s
		end
		xml.youtube @property.youtube
		xml.videoflag @property.featured
	end
end

        
