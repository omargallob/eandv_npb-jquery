class AddValidatedToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :validated, :bool
  end

  def self.down
    remove_column :properties, :validated
  end
end
