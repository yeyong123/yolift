class OrdersController < ApplicationController

	def index 
		@product = Product.find(params[:product_id])
	end

	def create
		@product = Product.find(params[:product_id])
		@order = @product.orders.create(params[:order])
		redirect_to product_orders_path
	end
end
