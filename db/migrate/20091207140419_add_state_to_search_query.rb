class AddStateToSearchQuery < ActiveRecord::Migration
  def self.up
    add_column :search_queries, :states, :string
  end

  def self.down
    remove_column :search_queries, :states
  end
end
