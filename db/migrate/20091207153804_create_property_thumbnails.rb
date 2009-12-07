class CreatePropertyThumbnails < ActiveRecord::Migration
  def self.up
    create_table :property_thumbnails do |t|
      t.integer :property_id
      t.integer :position
      t.string :photo_file_name
      t.integer :photo_file_size
      t.timestamps
    end
  end


  def self.down
    drop_table :property_thumbnails
  end
end
