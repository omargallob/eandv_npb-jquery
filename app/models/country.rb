class Country < ActiveRecord::Base
  has_many :locations
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"


	has_attached_file :flag,
										 :styles => {
                    		:thumb  => ["50x30>", :jpg]
                    },:convert_options => {  
                          :pagesize => "-strip -quality 60"
                    },										
										:storage => :s3,
										:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
										#:url =>  "/property/gallery/:id/:style/:basename.jpg",
										:path => "flags/:id/:style/:basename.jpg"

	has_attached_file :photo, :styles => {:small => ["130x56#",:jpg]},
                            :url => "/assets/country/:id/:style/:basename.jpg",    
                            :storage => :s3,
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/assets/country/:id/:style/:basename.jpg"

	validates_attachment_presence :flag
	validates_attachment_presence :photo

end
