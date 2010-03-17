xml.instruct!
	xml.propertygallery do
		if @property.gallery
			xml.propertyg do
				 @property.gallery.uploads.each do |upload|
					 xml.image  upload.photo.url(:pagesize).to_s
					 xml.thumb upload.photo.url(:thumb).to_s
					end		
			xml.youtube @property.youtube
			xml.videoflag @property.featured
		end
	end
end


