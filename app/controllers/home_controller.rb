class HomeController < ApplicationController
	before_filter :authenticate_admin!, only: [:dashboard] 
	def index
  end
	
	def sitemap
	end

	def link
#		@models = ActiveRecord::Base.descendants
	end

	def dashboard
		#控制台，后台的定义，这个控制器没有定义数据库，而是把所有的模型
		#都抓取出来，进行集中的管理，现在每个模型自己定义了编辑视图。但因为太分散了
		#不好集中编辑，所以这里进行了集中定义。同时进行集中定义，
		#为了能更好的进行数据查询，想进行ajax的查询，防止网站的效能因为所有数据很影响
		#访问速度。
		@products = Product.order("id desc").paginate(page: params[:page], per_page: 10)
		@categories = Category.order("id desc").paginate(page: params[:page], per_page: 10)
		@orders = Order.order("created_at desc").paginate(page: params[:page], per_page: 10)
		@affiliates = Affiliate.order("created_at desc").paginate(page: params[:page], per_page: 10)
		@abouts = About.order("id desc").paginate(page: params[:page], per_page: 10)	
		@bananers = Bananer.order("id desc").paginate(page: params[:page],per_page: 10)
		@jobs = Job.order("id desc").paginate(page: params[:page], per_page: 10)
		@servers = Server.order("id desc").paginate(page: params[:page], per_page: 10)
		@zixuns = Zixun.order("id desc").paginate(page: params[:page], per_page: 10)
		@centers = Center.order("id desc").paginate(page: params[:page], per_page: 10)
		@aftermarkets = Aftermarket.order("id desc").paginate(page: params[:page], per_page: 10)
		@contact = Contact.order("id desc").paginate(page: params[:page], per_page: 10)
		#order("id desc").paginate(page: params[:page], per_page: 10)
		#order("id desc").paginate(page: params[:page], per_page: 10)
		#order("id desc").paginate(page: params[:page], per_page: 10)



	end

	def error
	end
end
