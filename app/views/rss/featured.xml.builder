xml.instruct!
xml.featured do
   @featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.image(upload.photo.url(:pagesize), :path=>	upload.photo.url(:thumb))
			 xml.addressA property.title
			 xml.addressB property.location.region+", "+property.location.county+", "+property.location.state
 			 xml.bedrooms property.bedrooms.to_s
 			 xml.bathrooms property.bathrooms.to_s
			 xml.lotsize property.built	
			 xml.sqf property.plot	
			 xml.price number_to_currency(property.price, :precision => 0)	
			 xml.countryflag property.location.country.flag.url()	
			 xml.youtube property.youtube	
	     xml.plink property_path(property)	
			end	
		end
  end
end
