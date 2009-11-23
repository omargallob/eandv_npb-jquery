class AddAddressToPartners < ActiveRecord::Migration
  def self.up
    add_column :partners, :address, :text
    add_column :partners, :telephone, :string
  end

  def self.down
    remove_column :partners, :telephone
    remove_column :partners, :address
  end
end
