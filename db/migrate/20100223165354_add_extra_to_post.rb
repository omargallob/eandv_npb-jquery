class AddExtraToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :navlabel, :string
    add_column :posts, :name, :string
  end

  def self.down
    remove_column :posts, :name
    remove_column :posts, :navlabel
  end
end
