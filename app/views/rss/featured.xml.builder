xml.instruct!
xml.images do
   @featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.image(upload.photo.url(:pagesize), :path=>	upload.photo.url(:thumb))

			end	
		end
  end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.addressa property.title

			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.addressb property.location.region+", "+property.location.county+", "+property.location.state

			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
		 			 xml.bedrooms property.bedrooms.to_s

			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
		 		 xml.bathrooms property.bathrooms.to_s

			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.lotsize property.built	

			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.sqf property.plot	

			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
				xml.price number_to_currency(property.price, :precision => 0)	
			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.countryflag property.location.country.flag.url()	
			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
			 xml.youtube property.youtube	
			end	
		end
	end
	@featured.each do |property|
		if property.featured_gallery	
			property.featured_gallery.featured_uploads.each do |upload|
	     xml.plink property_path(property)	
			end	
		end
	end
end
