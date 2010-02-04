class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.string :full_name
      t.string :title
      t.text :description
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end
