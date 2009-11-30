class AddSwfContentToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :title_front, :string
    add_column :categories, :title_back, :string
  end

  def self.down
    remove_column :categories, :title_back
    remove_column :categories, :title_front
  end
end
