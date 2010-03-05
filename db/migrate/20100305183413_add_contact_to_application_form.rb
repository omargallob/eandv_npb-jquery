class AddContactToApplicationForm < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :contact, :bool
  end

  def self.down
    remove_column :application_forms, :contact
  end
end
