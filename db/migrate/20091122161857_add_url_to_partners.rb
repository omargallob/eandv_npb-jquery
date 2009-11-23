class AddUrlToPartners < ActiveRecord::Migration
  def self.up
    add_column :partners, :url, :text
  end

  def self.down
    remove_column :partners, :url
  end
end
