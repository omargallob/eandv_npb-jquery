class AddAttachmentsPhotoToUploadThumb < ActiveRecord::Migration
  def self.up
    add_column :upload_thumbs, :photo_file_name, :string
    add_column :upload_thumbs, :photo_content_type, :string
    add_column :upload_thumbs, :photo_file_size, :integer
    add_column :upload_thumbs, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :upload_thumbs, :photo_file_name
    remove_column :upload_thumbs, :photo_content_type
    remove_column :upload_thumbs, :photo_file_size
    remove_column :upload_thumbs, :photo_updated_at
  end
end
