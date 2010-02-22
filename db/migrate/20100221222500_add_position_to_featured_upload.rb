class AddPositionToFeaturedUpload < ActiveRecord::Migration
  def self.up
    add_column :featured_uploads, :position, :integer
  end

  def self.down
    remove_column :featured_uploads, :position
  end
end
