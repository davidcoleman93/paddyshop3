class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column "products", "title", :string
	add_column "products", "manufacturer", :string
	add_column "products", "category", :string
	add_column "products", "image", :string
	add_column "products", "stock_level", :integer
	add_column "products", "price", :decimal
  end
end
