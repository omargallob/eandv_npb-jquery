class CreateSearchQueries < ActiveRecord::Migration
  def self.up
    create_table :search_queries do |t|
      t.string :query
      t.string :country
      t.string :region
      t.string :area
      t.string :buy_rent
      t.integer :price
      t.integer :bedrooms
      t.string :mls
      t.string :zip
      t.timestamps
    end
  end

  def self.down
    drop_table :search_queries
  end
end
