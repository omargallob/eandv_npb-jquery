class FeaturedUpload < ActiveRecord::Base
	belongs_to :featured_gallery
  has_attached_file :photo,
                    :styles => {
                      :pagesize => ["961x359#", :jpg]
                    },:convert_options => {  
                          :pagesize => "-strip -quality 60"
                    },:processors => [:cropper],
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "property/featured/gallery/:id/:style/:basename.jpg"
  acts_as_list :scope => :featured_gallery
end
