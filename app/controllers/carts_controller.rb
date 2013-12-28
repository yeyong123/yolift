class CartsController < ApplicationController

	def show
		if @cart.line_items.empty?
			redirect_to products_path, notice: "你还没有添加任何产品!"
			return
		end
		 @cart.line_items.each do |item|
		if	item.productnumbers.empty?
			item.destroy
		end
		 end

	end
end
