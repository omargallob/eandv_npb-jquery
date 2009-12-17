class Partner < ActiveRecord::Base

  belongs_to :category
  
   has_attached_file :photo,
                       :styles => {
                         :pagesize => ["304x159>", :jpg]
                       },:convert_options => {  
                             :pagesize => "-strip -quality 60"
                       },
                       :storage => :s3,
                       :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                       :path => "services/partner/:id/:style/:basename.jpg"

  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h     


  # before_edit :reset_photo
  # after_update  :reprocess_photo, :if => :cropping?

  # def cropping?
  #    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  #  end  

  #  def photo_geometry(style = :original)
 #     @geometry ||= {}
  #    @geometry[style] ||= Paperclip::Geometry.from_file(photo.to_file(style))
  #  end

  #  private
 #     def reprocess_photo
 #       photo.reprocess!
  #    end
 #     def reset_photo
 #       photo.reprocess!
  #    end
      
      

end
