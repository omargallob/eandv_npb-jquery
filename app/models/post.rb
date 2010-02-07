class Post < ActiveRecord::Base
	belongs_to :user    
	
		auto_html_for :description do
      html_escape
      image
      youtube :width => 419, :height => 317
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end
end
