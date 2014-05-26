class ImageProductsController < ApplicationController

	def new
		@image_product = ImageProduct.new
	end
end
