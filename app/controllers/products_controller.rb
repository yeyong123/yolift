class ProductsController < ApplicationController
	before_filter :authenticate_admin!, only: [:create, :new, :edit, :update, :destroy]

	def index
		unless params[:t]
			@products = Product.order("updated_at desc").paginate(page: params[:page], per_page: 12)
		else 
			@products = Product.where("tag_id = ?", params[:t]).order("id desc").paginate(page: params[:page], per_page: 12)
		end
		@products.each do |product|
			product.photos.build
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
	end

	def edit
		@product = Product.find(params[:id])
		@productcolors = Productcolor.all
	end

	def create
		@product = Product.new(params[:product])
		respond_to do |format|
			if @product.save
				format.html { redirect_to products_path, notice: '创建成功'}
				format.json { render json: products_path, status: :created, location: @products }

			else
				format.html { render action: "new"}
				format.json { render json: @product.errors, status: :unprocessable_entity}
			end
		end
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			redirect_to products_path
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end


	def search
		begin
			@products = Product.joins(:productnumbers).where("title like ? or productnumbers.number like ?",
			'%'+params[:q]+'%', '%'+params[:q]+'%').uniq.order("id desc").paginate(page: params[:page], per_page: 12)
			if @products.empty?
				redirect_to products_path, notice: "没有找到相关，请重新搜索！"
			else
				render 'index'
			end
		end
	end


end
