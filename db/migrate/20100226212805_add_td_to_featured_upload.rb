class AddTdToFeaturedUpload < ActiveRecord::Migration
  def self.up
    add_column :featured_uploads, :title, :string
    add_column :featured_uploads, :description, :text
  end

  def self.down
    remove_column :featured_uploads, :description
    remove_column :featured_uploads, :title
  end
end
