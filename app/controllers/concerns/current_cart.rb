module CurrentCart
	extend ActiveSupport::Concern
	
	private
	
	def set_cart
		@cart = Cart.find(session[:cart_id]) #Trys to find a cart_id from sessions
	   rescue ActiveRecord::RecordNotFound
		@cart = Cart.create	#Creates a new cart if not found
		session[:cart_id] = @cart.id	#Sets cart_id in sessions
	end
end