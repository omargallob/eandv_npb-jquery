class AddPositionToWorker < ActiveRecord::Migration
  def self.up
    add_column :workers, :position, :integer
  end

  def self.down
    remove_column :workers, :position
  end
end
