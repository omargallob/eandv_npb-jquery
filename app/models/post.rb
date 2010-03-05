class Post < ActiveRecord::Base
	belongs_to :user    
	has_many :subposts, :class_name => 'Post', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Post', :foreign_key => 'parent_id'

 has_attached_file :photo, :styles => {:small => "80x60#", :large => "419x317#"},
                            :url => "/assets/posts/:id/:style/:basename.jpg",
                            :storage => :s3,
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                            :path => "/assets/posts/:id/:style/:basename.jpg"
			
 def self.find_main
    Post.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
 end
  
 def self.find_sub(pid)
    Post.find(:all, :conditions => ['parent_id = ?', pid])
 end

	def self.find_all_sub
		Post.find(:all, :conditions => ['parent_id > 0'], :order => 'position')
	end
end
