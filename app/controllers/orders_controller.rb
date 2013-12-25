class OrdersController < ApplicationController
	
	def index
	end

	def show
	end

	def new
		if @cart.line_items.empty?
			redirect_to error_path, notice: "还没有添加任何产品!"
		return
		end
	@order = Order.new	
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end
end
