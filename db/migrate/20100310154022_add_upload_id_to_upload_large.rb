class AddUploadIdToUploadLarge < ActiveRecord::Migration
  def self.up
    add_column :upload_larges, :upload_id, :integer
  end

  def self.down
    remove_column :upload_larges, :upload_id
  end
end
