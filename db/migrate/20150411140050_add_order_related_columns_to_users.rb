class AddOrderRelatedColumnsToUsers < ActiveRecord::Migration
  def change
	add_column :users, :shipping_address, :string
	add_column :users, :card_number, :integer
	add_reference :orders, :user, index: true
  end
end
