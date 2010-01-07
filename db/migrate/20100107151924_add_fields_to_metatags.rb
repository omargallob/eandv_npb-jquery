class AddFieldsToMetatags < ActiveRecord::Migration
  def self.up
    add_column :metatags, :category_id, :integer
    add_column :metatags, :property_id, :integer
  end

  def self.down
    remove_column :metatags, :property_id
    remove_column :metatags, :category_id
  end
end
