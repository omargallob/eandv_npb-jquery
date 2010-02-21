class CreateFeaturedGalleries < ActiveRecord::Migration
  def self.up
    create_table :featured_galleries do |t|
			t.integer :property_id
      t.timestamps
    end
  end

  def self.down
    drop_table :featured_galleries
  end
end
