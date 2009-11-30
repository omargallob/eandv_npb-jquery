class AddSwfContentLinkToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :link_text, :string
  end

  def self.down
    remove_column :categories, :link_text
  end
end
