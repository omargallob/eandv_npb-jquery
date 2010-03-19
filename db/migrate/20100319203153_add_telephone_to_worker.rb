class AddTelephoneToWorker < ActiveRecord::Migration
  def self.up
    add_column :workers, :telephone, :string
  end

  def self.down
    remove_column :workers, :telephone
  end
end
