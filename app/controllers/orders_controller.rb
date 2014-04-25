class OrdersController < ApplicationController
	skip_before_filter :authenticate_admin!
	before_filter :authenticate_admin_user!, only: [:index, :show, :edit, :destroy]	
	def index
		@orders = Order.order("updated_at desc").uniq.paginate(page: params[:page], per_page: 12)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		if @cart.line_items.empty?
			redirect_to products_path, notice: "还没有添加任何产品!"
		return
		end
	@order = Order.new	
	end

	def edit
		@order = Order.find(params[:id])
	end

	def create
		@order = Order.new(params[:order])
		@order.add_line_items_from_cart(@cart)
		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to root_path, notice: "感谢你的订单，我们会马上联系你！"
		else
			render 'new'
		end
	end

	def update
		@order = Order.find(params[:id])
		if @order.update_attributes(params[:order])
			redirect_to :back
		else
			render 'edit'
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to :back
	end
end
