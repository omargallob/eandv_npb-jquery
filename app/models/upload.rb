class Upload < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo,
                      :styles => {
                        :thumb => ["120x90#", :jpg],
                        :pagesize => ["720x560>", :jpg],
                      },:processors => [:cropper],
                      :storage => :s3,
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :path =>"/property/gallery/:id/:style/:basename.jpg"

            
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h     
  
  acts_as_list :scope => :gallery
  
 # before_edit :reset_photo
  after_update  :reprocess_photo, :if => :cropping?
 
  before_photo_post_process do |upload|
    false if upload.processing? # do not process if just added
  end

  after_create do |upload|
    Delayed::Job.enqueue UploadJob.new(upload.id) # add to queue
  end
  
  def cropping?
     !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
   end  

   def photo_geometry(style = :original)
     @geometry ||= {}
     @geometry[style] ||= Paperclip::Geometry.from_file(photo.to_file(style))
   end
  
   def perform
     self.processing = false # unlock for processing
     photo.reprocess! # do the processing
     save
   end
   
   def url(style = :original)
     if self.photo && processing? && style != :original
       return photo.send(:interpolate, @@default_url, "#{style}")
     end
     photo.url(style)
   end
   
   private
     def reprocess_photo
       photo.reprocess!
     end
     def reset_photo
       photo.reprocess!
     end
     

end
