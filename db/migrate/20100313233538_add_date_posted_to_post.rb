class AddDatePostedToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :date, :datetime
  end

  def self.down
    remove_column :posts, :date
  end
end
