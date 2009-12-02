class Type < ActiveRecord::Base
  has_many :developments
  has_many :properties
  
  acts_as_ferret  :fields => [:title]#:fields => [:location_state,:type_title]
  
end
