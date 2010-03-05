class AddExtraToApplicationForm < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :re_know_how, :bool
  end

  def self.down
    remove_column :application_forms, :re_know_how
  end
end
