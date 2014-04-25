class HomeController < ApplicationController
	before_filter :authenticate_admin_user!, only: [:dashboard] 
	def index
		@zixuns = Zixun.order("created_at desc").paginate(page: params[:page], per_page: 5)
		
		
	end

	def sitemap
	end

	def link
		@models = ActiveRecord::Base.subclasses
		@table = @models[1]
	end

	def dashboard
		#控制台，后台的定义，这个控制器没有定义数据库，而是把所有的模型
		#都抓取出来，进行集中的管理，现在每个模型自己定义了编辑视图。但因为太分散了
		#不好集中编辑，所以这里进行了集中定义。同时进行集中定义，
		#为了能更好的进行数据查询，想进行ajax的查询，防止网站的效能因为所有数据很影响
		#访问速度。
		@products_grid = initialize_grid(Product, include: [:tag, :productnumbers, :category,:videos], order: 'title',per_page: 15)
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
		@lists = List.order("id desc").paginate(page: params[:page], per_page: 10)
		@guides = Guide.order("id desc").paginate(page: params[:page], per_page: 10)
		@payments = Payment.order("id desc").paginate(page: params[:page], per_page: 10)
		@ships = Ship.order("id desc").paginate(page: params[:page], per_page: 10)
		@items = Item.order("id desc").paginate(page: params[:page], per_page: 10)
		@cases = Case.order("id desc").paginate(page: params[:page], per_page: 10)
		@catelogs = Catelog.order("crated_at desc").paginate(page: params[:page], per_page: 10)
		@messages = Message.order("created_at desc").paginate(page: params[:page], per_page: 10)
		@product_images = ProductImage.order("created_at desc").paginate(page: params[:page], per_page: 8)
		@center_images = CenterImage.order("created_at desc").paginate(page: params[:page], per_page: 8)
		@server_images = ServerImage.order("created_at desc").paginate(page: params[:page], per_page: 8)
		@contact_images = ContactImage.order("created_at desc").paginate(page: params[:page], per_page: 8)
	end

	def error
	end
end
