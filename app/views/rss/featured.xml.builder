xml.instruct!
xml.homes do
   @featured.each do |property|
		xml.featuredproperty do
			if property.featured_gallery	
				property.featured_gallery.featured_uploads.each do |upload|
				 xml.image(upload.photo.url(:pagesize))
				 xml.thumb(upload.photo.url(:thumb))	
				end	
			end
			xml.title property.title
			xml.title2 property.location.region+", "+property.location.county_initials+", "+property.location.state_initials
			xml.beds property.bedrooms.to_s
			xml.baths property.bathrooms
			xml.lotsize property.plot	
			xml.builtsize property.built
			xml.price number_to_currency(property.price, :precision => 0)		
			xml.flagurl property.location.country.flag.url()	
			xml.featuredlink property.featured 
			xml.youtubelink property.youtube	
			xml.propertylink property_full_path(property.location.region.gsub(/ /,"-"),property.title.gsub(/ /,"-"))
		end
  end
	
end
