class AddCategoryIdtoPartners < ActiveRecord::Migration
  def self.up
    add_column :partners, :category_id, :integer
  end

  def self.down
    remove_column :partners, :category_id
  end
end
