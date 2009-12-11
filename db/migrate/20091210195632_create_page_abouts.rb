class CreatePageAbouts < ActiveRecord::Migration
  def self.up
    create_table :page_abouts do |t|
      t.integer :page_id
      t.string :photo_file_name
      t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :page_abouts
  end
end
