class Worker < ActiveRecord::Base
   has_attached_file :photo,
                       :styles => {
                         :pagesize => ["120x115>", :jpg]
                       }, :processors => [:cropper],:convert_options => {  
                             :pagesize => "-strip -quality 60"
                       },
                       :storage => :s3,
                       :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                       :path => "staff/worker/:id/:style/:basename.jpg"

	validates_presence_of :full_name, :description, :title, :email
	validates_uniqueness_of :full_name, :email

   attr_accessor :crop_x, :crop_y, :crop_w, :crop_h     


  # before_edit :reset_photo
   after_update  :reprocess_photo, :if => :cropping?

   def cropping?
      !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
    end  

    def photo_geometry(style = :original)
      @geometry ||= {}
      @geometry[style] ||= Paperclip::Geometry.from_file(photo.to_file(style))
    end

    private
      def reprocess_photo
        photo.reprocess!
      end
      def reset_photo
        photo.reprocess!
      end
end
