class AddAttachmentsMainToPageFeaturedPhoto < ActiveRecord::Migration
  def self.up
    add_column :page_featured_photos, :main_file_name, :string
    add_column :page_featured_photos, :main_content_type, :string
    add_column :page_featured_photos, :main_file_size, :integer
    add_column :page_featured_photos, :main_updated_at, :datetime
  end

  def self.down
    remove_column :page_featured_photos, :main_file_name
    remove_column :page_featured_photos, :main_content_type
    remove_column :page_featured_photos, :main_file_size
    remove_column :page_featured_photos, :main_updated_at
  end
end
