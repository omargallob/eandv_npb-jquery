class AddDateToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :date_posted, :string
  end

  def self.down
    remove_column :posts, :date_posted
  end
end
