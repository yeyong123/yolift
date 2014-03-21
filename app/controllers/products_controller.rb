class ProductsController < ApplicationController

	def index
		unless params[:t]
			@products = Product.order("paixu asc").paginate(page: params[:page], per_page: 12)
		else 
			@products = Product.where("tag_id = ?", params[:t]).order("paixu desc").paginate(page: params[:page], per_page: 12)
		end
	end

	def show
		begin
			@product = Product.find(params[:id])
			@line_item = @product.line_items.build
			@productnumbers = @product.productnumbers
		rescue ActiveRecord::RecordNotFound
			logger.error "访问无效的产品页面#{params[:id]}"
			redirect_to products_path
		end

	end

	def new
		@product = Product.new
		@productcolors = Productcolor.all
		@category = Category.joins(:products).where(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
		@productcolors = Productcolor.all
		@categories = Category.all 
	end

	def create
		@product = Product.new(params[:product])
		respond_to do |format|
			if @product.save
				format.html { redirect_to dashboard_path, notice: '创建成功'}
				format.js
			else
				format.html { render :new}
				format.js
			end
		end
	end

	def update
		@product = Product.find(params[:id])
		respond_to do |format|
			if @product.update_attributes(params[:product])
				format.html {redirect_to dashboard_path}
				format.js{product = @product}
			else
				format.html {render 'edit'}
				format.js
			end
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to :back
	end


	def search
		begin
			@products = Product.joins(:productnumbers).where("title like ? or productnumbers.number like ?",
			"%"+params[:q]+"%", "%"+params[:q]+"%").uniq.order("paixu desc").paginate(page: params[:page], per_page: 12)
			if @products.empty?
				redirect_to products_path, notice: "没有找到你想要的产品，请联系我们的客服4008 373 288！"
			else
				render 'index'
			end
		end
	end

	def video
		@products = Product.order("paixu desc").paginate(page: params[:page], per_page: 8)
	end


end
