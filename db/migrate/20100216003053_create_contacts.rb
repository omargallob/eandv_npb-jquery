class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :telephone
      t.string :email
      t.string :interested_in
      t.string :property_type
      t.string :country
      t.string :state
      t.string :city
      t.integer :beds
      t.integer :baths
      t.string :price_range
      t.text :message
      t.bool :mailing

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
