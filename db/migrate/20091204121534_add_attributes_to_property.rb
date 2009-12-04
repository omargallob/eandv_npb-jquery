class AddAttributesToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :half_bathrooms, :integer
    add_column :properties, :garage, :integer
    add_column :properties, :property_number, :string
  end

  def self.down
    remove_column :properties, :property_number
    remove_column :properties, :garage
    remove_column :properties, :half_bathrooms
  end
end
