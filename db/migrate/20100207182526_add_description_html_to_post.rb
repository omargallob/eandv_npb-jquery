class AddDescriptionHtmlToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :description_html, :text
  end

  def self.down
    remove_column :posts, :description_html
  end
end
