class Category < ActiveRecord::Base
  has_many :partners
	has_one :metatag
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'
	
 validates_presence_of :name, :title, :navlabel
 validates_uniqueness_of :name, :title, :navlabel

  has_attached_file :photo, :styles => {:small => "92x61#", :large => "403x170>"}, :processors => [:cropper],
                            :url => "/assets/categories/:id/:style/:basename.jpg",
                            :storage => :s3,
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/assets/categories/:id/:style/:basename.jpg"

  has_attached_file :main, :styles => {:large => "138x206>"}, :processors => [:cropper],
                            :url => "/assets/categories/:id/main/:style/:basename.extension",
                            :storage => :s3,
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/assets/categories/:id/main/:style/:basename.jpg"                           
  #validates_attachment_presence :photo
  #validates_attachment_size :photo, :less_than => 5.megabytes                          
  #validates_attachment_content_type :content_type => ["image/jpeg","image/png"]
  


  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h               
  after_update  :reprocess_photo, :if => :cropping?

 
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end  

  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.to_file(style))
  end
  
  def self.find_main
    Category.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
  end
  
  def self.find_sub(pid)
    Category.find(:all, :conditions => ['parent_id = ?', pid])
  end
  
  def self.find_all_sub
    Category.find(:all, :conditions => ['parent_id > 0'], :order => 'position')
  end
  
  private
    def reprocess_photo
      photo.reprocess!
    end

end
