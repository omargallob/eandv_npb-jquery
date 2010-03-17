class PostGallery < ActiveRecord::Base
belongs_to :post

has_many :post_uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? },
           :dependent => :destroy

end
