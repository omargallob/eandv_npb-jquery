class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :telephone, :string
    add_column :users, :mailing, :bool
  end

  def self.down
    remove_column :users, :mailing
    remove_column :users, :telephone
  end
end
