class CatelogImagesController < ApplicationController
	before_filter :find_id, only: [:show,:edit,:update, :destroy]
	
	def index
		@catelog_images = CatelogImage.all
	end

	def show
	end

	def edit
	end

	def new
		@catelog_image = CatelogImage.new
	end

	def create
		@catelog_image = CatelogImage.new(params[:catelog_image])
		if @catelog_image.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		if @catelog_image.update_attributes(params[:catelog_image])
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@catelog_image.destroy
		redirect_to root_path
	end

	private

	def find_id
		@catelog_image = CatelogImage.find(params[:id])
	end
end
