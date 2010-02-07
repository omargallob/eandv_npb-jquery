class AddOpeningToWorker < ActiveRecord::Migration
  def self.up
    add_column :workers, :vacancy, :bool
  end

  def self.down
    remove_column :workers, :vacancy
  end
end
