class Type < ActiveRecord::Base
  has_many :developments
  has_many :properties
  
   acts_as_solr :fields => [:title] #:fields => [:location_state,:type_title]
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
  validates_presence_of :title, :on => :create, :message => "can't be blank'"
end
