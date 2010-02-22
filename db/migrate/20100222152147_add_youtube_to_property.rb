class AddYoutubeToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :youtube, :string
  end

  def self.down
    remove_column :properties, :youtube
  end
end
