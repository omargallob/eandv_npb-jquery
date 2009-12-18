xml.instruct!
xml.images do
	@properties.each do |property|
		xml.image :path => property.gallery.uploads.first.photo.url(:thumb), :urlPath => property_path(property)
	end
end

