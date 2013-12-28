module OrdersHelper
	
	def order_sum(order_id)
		@order = Order.find(order_id)
	 @order.line_items.sum(:quantity)
	end	 
end
