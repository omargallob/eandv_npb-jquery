class AddSubtitleToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :subtitle, :string
  end

  def self.down
    remove_column :properties, :subtitle
  end
end
