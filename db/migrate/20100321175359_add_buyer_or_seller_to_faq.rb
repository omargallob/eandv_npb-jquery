class AddBuyerOrSellerToFaq < ActiveRecord::Migration
  def self.up
    add_column :faqs, :buyer_or_seller, :string
  end

  def self.down
    remove_column :faqs, :buyer_or_seller
  end
end
