class CreateGooglemaps < ActiveRecord::Migration
  def self.up
    create_table :googlemaps do |t|
      t.integer :property_id
      t.string :long_lat

      t.timestamps
    end
  end

  def self.down
    drop_table :googlemaps
  end
end
