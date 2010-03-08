class CreateCategoryMains < ActiveRecord::Migration
  def self.up
    create_table :category_mains do |t|
      t.integer :category_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :category_mains
  end
end
