class AddFieldsToGooglemaps < ActiveRecord::Migration
  def self.up
    add_column :googlemaps, :long, :string
    add_column :googlemaps, :lat, :string    
  end

  def self.down
    remove_column :googlemaps, :long
    remove_column :googlemaps, :lat
  end
end
