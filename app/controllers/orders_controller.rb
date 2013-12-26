class OrdersController < ApplicationController
	
	def index
		@orders = Order.order("updated_at desc").uniq.paginate(page: params[:page], per_page: 12)
	end

	def show
		@order = Order.find(params[:id])
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
		@order = Order.new(params[:order])
		@order.add_line_items_from_cart(@cart)
		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to orders_path, notice: "感谢你的订单，我们会马上联系你！"
		else
			render 'new'
		end
	end

	def update
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to :back
	end
end
