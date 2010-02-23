class Post < ActiveRecord::Base
	belongs_to :user    
	has_many :subposts, :class_name => 'Post', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Post', :foreign_key => 'parent_id'

		auto_html_for :description do
      html_escape
      image
      youtube :width => 419, :height => 317
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end
			
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
