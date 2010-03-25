class AddUserUniqueIdentifierToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :unique_identifier, :string
  end

  def self.down
    remove_column :users, :unique_identifier
  end
end
