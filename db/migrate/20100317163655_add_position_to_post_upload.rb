class AddPositionToPostUpload < ActiveRecord::Migration
  def self.up
    add_column :post_uploads, :position, :integer
  end

  def self.down
    remove_column :post_uploads, :position
  end
end
