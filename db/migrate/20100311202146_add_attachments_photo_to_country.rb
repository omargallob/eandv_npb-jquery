class AddAttachmentsPhotoToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :photo_file_name, :string
    add_column :countries, :photo_content_type, :string
    add_column :countries, :photo_file_size, :integer
    add_column :countries, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :countries, :photo_file_name
    remove_column :countries, :photo_content_type
    remove_column :countries, :photo_file_size
    remove_column :countries, :photo_updated_at
  end
end
