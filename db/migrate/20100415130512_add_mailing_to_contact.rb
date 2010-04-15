class AddMailingToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :mailing, :boolean
  end

  def self.down
    remove_column :contacts, :mailing
  end
end
