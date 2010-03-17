class CreatePostGalleries < ActiveRecord::Migration
  def self.up
    create_table :post_galleries do |t|
      t.integer :post_id
      t.string :title
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :post_galleries
  end
end
