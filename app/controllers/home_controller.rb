class HomeController < ApplicationController
	
	def index
		@products= Product.all
		@products.each do |product|
			product.photos.build
		end
		@cart = find_cart
  end


	def about
	end

	def error
	end
end
