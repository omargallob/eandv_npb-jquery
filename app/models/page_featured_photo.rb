class PageFeaturedPhoto < ActiveRecord::Base
 belongs_to :page
 
  has_attachment :content_type => :image,
                 :max_size => 10.megabytes,
                 :path_prefix  => "public/images/featured/page",
                 :resize_to => "x359",
                 :thumbnails => { :thumb => [134, 50] }
                 

   validates_as_attachment 
  
end
