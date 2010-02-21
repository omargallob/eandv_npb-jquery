class CreateFeaturedUploads < ActiveRecord::Migration
  def self.up
    create_table :featured_uploads do |t|
      t.integer :featured_gallery_id

      t.timestamps
    end
  end

  def self.down
    drop_table :featured_uploads
  end
end
