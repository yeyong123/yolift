class ProductImagesController < ApplicationController
	skip_before_filter :authenticate_admin!
	before_filter :authenticate_admin!
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@product_images = ProductImage.order("created_at desc").paginate(page: params[:page], per_page: 8)
	end

	def show
	end

	def edit
	end

	def new
		@product_image = ProductImage.new
	end

	def create
		@product_image = ProductImage.new(params[:product_image])
		if @product_image.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @product_image.update_attributes(params[:product_image])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@product_image.destroy
		redirect_to dashboard_path
	end

	private

	def find_id
		@product_image = ProductImage.find(params[:id])
	end
end
