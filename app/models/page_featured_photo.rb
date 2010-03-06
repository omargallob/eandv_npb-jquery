class PageFeaturedPhoto < ActiveRecord::Base
 belongs_to :page
 
	has_attached_file :main,:styles => {:pagesize => ["419x317#", :jpg]},:convert_options => {:pagesize => "-strip -quality 60"},:processors => [:cropper],
                       :storage => :s3,
                       :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                       :path => "/assets/page/:id/main/:style/:basename.jpg",
                       :url => "/assets/page/:id/main/:style/:basename.jpg"    


    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h               
  after_update  :reprocess_main, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end  
  
  def thumb_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(main.to_file(style))
  end

  
  
end
