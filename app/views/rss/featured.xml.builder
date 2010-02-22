xml.instruct!
xml.featured do
	 xml.image "/images/fBar.jpg"			
   @featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.ptitle property.title+", "+property.bedrooms.to_s+" Bedrooms & "+property.bathrooms.to_s+" Bathrooms "
	     xml.link property_path(property)	
			 xml.image upload.photo.url()	
			end	
		end
  end
end
