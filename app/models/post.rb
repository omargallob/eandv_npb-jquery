class Post < ActiveRecord::Base
  has_many :comments

	has_many :subposts, :class_name => 'Post', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Post', :foreign_key => 'parent_id'
	has_one :post_gallery
 has_attached_file :photo, :styles => {:small => "90x65#", :large => "419x317#"},
                            :url => "/assets/posts/:id/:style/:basename.jpg",
                            :storage => :s3,:processors => [:cropper],
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/assets/posts/:id/:style/:basename.jpg"

	validates_presence_of :title, :description, :body_html, :navlabel, :name
	validates_uniqueness_of :title, :navlabel, :name

 def self.find_main
    Post.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
 end
  
 def self.find_sub(pid)
    Post.find(:all, :conditions => ['parent_id = ?', pid], :order => 'date DESC')
 end

	def self.find_all_sub
		Post.find(:all, :conditions => ['parent_id > 0'], :order => 'date DESC')
	end

 def self.has_title?(title)
	result = Post.find(:all, :conditions => ['title = ?',title])
	if result.size == 1
		return true
	else
		return false
	end
 end		

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
