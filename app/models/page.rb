class Page < ActiveRecord::Base
  
  has_one :metatag
 
  has_one :page_about
  has_one :page_featured_photo
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'
  
  has_attached_file :thumb, :styles => {:small => ["130x56#",:jpg], :large =>["762x354>",:jpg]}, :processors => [:cropper],
                            :url => "/assets/page/:id/thumb/:style/:basename.jpg",    
                            :storage => :s3,
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/assets/page/:id/thumb/:style/:basename.jpg"
	has_attached_file :main,:styles => {:pagesize => ["419x317#", :jpg]},:convert_options => {:pagesize => "-strip -quality 60"},:processors => [:cropper],
                       :storage => :s3,
                       :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                       :path => "/assets/page/:id/main/:style/:basename.jpg",
                       :url => "/assets/page/:id/main/:style/:basename.jpg"    


  #validates_attachment_presence :thumb
  #validates_attachment_size :thumb, :less_than => 5.megabytes
  
	validates_presence_of :name, :body, :title, :navlabel
	validates_uniqueness_of :name, :body, :title, :navlabel
	#validates_numericality_of	:price, :plot, :built, :bedrooms, :bathrooms, :living_areas, :garage

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h               
  after_update  :reprocess_thumb, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end  
  
  def thumb_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(thumb.to_file(style))
  end

  
  
  def self.find_main
    Page.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
  end

  def self.find_sub(pid)
    Page.find(:all, :conditions => ['parent_id = ?', pid], :order => 'position')
  end
	


  private
    def reprocess_thumb
      thumb.reprocess!
    end
 # auto_html_for :body do
 #     html_escape
 #     image
 #    youtube :width => 400, :height => 250
 #     link :target => "_blank", :rel => "nofollow"
 #   simple_format
 #  end
end
