class Metatag < ActiveRecord::Base

	belongs_to :page
	belongs_to :category
	belongs_to :property

end
