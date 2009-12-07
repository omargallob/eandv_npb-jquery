class Property < ActiveRecord::Base

  belongs_to :location
  belongs_to :type
  has_and_belongs_to_many :facilities

  has_one :featured_photo
  has_one :gallery
  has_one :property_thumbnail
  
  acts_as_ferret  :fields => [:title, :bedrooms]#:fields => [:location_state,:type_title]

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
  
  #has_many :facility_properties, :dependant => true
  #has_many :facilities,:through => :facility_properties
end
