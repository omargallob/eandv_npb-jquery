class AddSwfDescriptionToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :description_swf, :string
  end

  def self.down
    remove_column :categories, :description_swf
  end
end
