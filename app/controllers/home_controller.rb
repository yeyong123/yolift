class HomeController < ApplicationController
	
	def index
    if params[:set_locale]
      redirect_to root_path(locale: params[:set_locale])
    else
		@products = Product.all
		@cart = find_cart
	end
  end


	def about
	end

	def contact
	end
end
