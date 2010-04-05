xml.instruct!
xml.images do
	@properties.each do |property|
		xml.image :path => property.gallery.uploads.first.photo.url(:thumb), :urlPath => property_full_path(property.location.region.gsub(/ /,"-"),property.title.gsub(/ /,"-"))
	end
end

