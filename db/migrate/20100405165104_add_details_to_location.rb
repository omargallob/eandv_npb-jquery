class AddDetailsToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :state_initials, :string
    add_column :locations, :county_initials, :string
  end

  def self.down
    remove_column :locations, :county_initials
    remove_column :locations, :state_initials
  end
end
