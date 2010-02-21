class AddGossipToFaq < ActiveRecord::Migration
  def self.up
    add_column :faqs, :gossip, :bool
  end

  def self.down
    remove_column :faqs, :gossip
  end
end
