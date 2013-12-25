class CartsController < ApplicationController

	def show
		if @cart.line_items.empty?
			redirect_to error_path, notice: "你还没有添加任何产品!"
			return
		end
	end
end
