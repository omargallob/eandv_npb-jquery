class FeaturedGallery < ActiveRecord::Base
	belongs_to :property
	has_many :featured_uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? },
           :dependent => :destroy
end
