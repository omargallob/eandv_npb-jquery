class Location < ActiveRecord::Base
  belongs_to :country
  has_many :developments
  has_many :properties
  
  acts_as_ferret  :fields => [:state,:city,:city_initials,:region,:area,:zipcod,:county]
  
  
  validates_presence_of :state, :message => "can't be blank"
  validates_presence_of :county,  :message => "can't be blank"
  validates_presence_of :region,  :message => "can't be blank"  
  validates_presence_of :other,:message => "can't be blank"
  validates_presence_of :zipcod,  :message => "can't be blank"
end                              
                                 