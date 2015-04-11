class Order < ActiveRecord::Base
has_many :line_items, dependent: :destroy

PAYMENT_TYPES = ["Check", "Credit Card", "Purchase order"]

#validates :name, :address, :email, presence: true
validates :pay_type, inclusion: PAYMENT_TYPES

def add_line_items_from_cart(cart)
	cart.line_items.each do |item|
		thisProduct = Product.find(item.product_id)
		newstocklevel = thisProduct.stock_level - item.quantity
		#thisProduct.stock_level = 
		#thisProduct.update_attributes(stock_level: :newstocklevel)
		thisProduct.update_attributes(stock_level: newstocklevel)
		item.cart_id = nil
		line_items << item
	end
end

end
