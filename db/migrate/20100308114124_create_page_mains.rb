class CreatePageMains < ActiveRecord::Migration
  def self.up
    create_table :page_mains do |t|
      t.integer :page_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :page_mains
  end
end
