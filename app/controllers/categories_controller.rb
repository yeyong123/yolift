class CategoriesController < ApplicationController


	def index
		@categories = Category.order("id desc").paginate(page: params[:page], per_page: 12)
	end

	def show
		@category = Category.find(params[:id])
		@products = @category.products.paginate(page: params[:page], per_page: 2)
	end
		
	def new
		@category = Category.new
		end

	def edit
		@category = Category.find(params[:id])
	end
	
	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			redirect_to categories_path
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to products_path
	end
end
