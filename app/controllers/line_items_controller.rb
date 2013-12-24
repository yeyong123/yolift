class LineItemsController < ApplicationController

	#创建产品关联购物车
	#首先找到显示的单个产品的ID，当用户点击加入购物车，
	#把所关联的产品Id加入加入到LineItem中。因为line_item和product和一对多关系
	#到成功添加到line_item的数据库中，就转到cart的显示页面
	#pending，准备扩展的内容
	#在产品中也有货号和颜色。到用户选择产品加入购物车的时，也同时可以选择货号和颜色
	#让货号和颜色一起在购物车的显示的页面中显示。
	#思路是这样...
	#line_item有多个货号和颜色。货号和颜色在产品创建的时候就已经添加进数据库中
	#在单个产品显示页面就显示这个产品的货号和颜色。货号和颜色是采用多选的方法check_box
	#用户点击其中一个或是多个的产品的货号和颜色。就把这一个或多个添加到line_item中的
	def create
		@product = Product.find(params[:product_id])
		@line = @product.line_items.new(params[:line_item])
		if @line.save 
			redirect_to cart_path
	end
	end

#	def create
#		product = Product.find(params[:product_id])
#		@line_item = @cart.add_product(product.id)
#		if @line_item.save
#			redirect_to cart_path
#		end
#	end

	def destroy
		@product = Product.find(params[:product_id])
		@line_item = @product.line_items.find(params[:id])
		@line_item.destroy
		redirect_to :back
	end
end
