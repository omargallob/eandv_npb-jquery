class AddCityToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :city, :string
    add_column :locations, :city_initials, :string
  end

  def self.down
    remove_column :locations, :city_initials
    remove_column :locations, :city
  end
end
