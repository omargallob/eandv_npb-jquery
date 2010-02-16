class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.string :user_name

      t.timestamps
    end
  end

  def self.down
    drop_table :faqs
  end
end
