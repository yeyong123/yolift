class HomeController < ApplicationController
	before_filter :authenticate_admin_user!, only: [:dashboard] 
	def index
		@zixuns = Zixun.order("created_at desc").paginate(page: params[:page], per_page: 5)
		@categories = Category.limit(7)
	end

	def sitemap
	end

	def link
		@categories = Category.limit(7)
	end

	def error
	end
end
