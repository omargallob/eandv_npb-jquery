class Addprocessingtouploads < ActiveRecord::Migration
  def self.up
      add_column :uploads, :processing, :bool
  end

  def self.down
    remove_column :uploads, :processing
  end
end
