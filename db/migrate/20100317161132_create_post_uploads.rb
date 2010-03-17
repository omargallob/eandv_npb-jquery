class CreatePostUploads < ActiveRecord::Migration
  def self.up
    create_table :post_uploads do |t|
      t.integer :post_gallery_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :post_uploads
  end
end
