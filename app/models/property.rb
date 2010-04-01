class Property < ActiveRecord::Base

  belongs_to :location
  belongs_to :type
  has_and_belongs_to_many :facilities
	has_one :metatag
#  has_many :featured
  has_one :gallery
  has_one :featured_gallery
  has_one :property_thumbnail
  has_one :googlemap
  
	has_attached_file :pdf,
										:content_type => "pdf",
										:storage => :s3,
										:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
										#:url =>  "/property/gallery/:id/:style/:basename.jpg",
										:path => "property/:id/pdf/:style/:basename.pdf"

  #acts_as_ferret  :fields => [:title, :bedrooms,:mls_id]#:fields => [:location_state,:type_title]

	 acts_as_solr :fields => [:bedrooms, :bathrooms, :title]

	validates_attachment_content_type :pdf, :content_type => ['application/pdf']

	
	validates_presence_of :title,:subtitle, :description, :price, :plot, :built, :bedrooms, :address, :type_id
	validates_uniqueness_of :title, :address
	validates_numericality_of	:price, :plot, :built, :bedrooms, :bathrooms, :living_areas, :garage

    def location_state
      location.state
    end
    
    def type_title
      return "#{self.title}"
    end
    
    def price_condition(price)
      if self.price.to_i < price.to_i
        if self.price == 0
           return false
        else
          return true
         end
      else 
        return false
      end
    end

    def bedroom_condition(bedroom)
      if self.bedrooms == bedroom
        return true
      else 
        return false
      end
    end
  
    def mls_condition(mls)
      unless mls
        return false
      else
        if self.mls == mls
          return true
        else 
          return false
        end
      end
    end
  
    
  #has_many :facility_properties, :dependant => true
  #has_many :facilities,:through => :facility_properties
end
