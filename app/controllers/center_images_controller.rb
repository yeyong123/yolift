class CenterImagesController < ApplicationController
		before_filter :find_id, only: [:edit, :update, :destroy]

	def edit
	end

	def new
		@center_image = CenterImage.new
	end

	def create
		@center_image = CenterImage.new(params[:center_image])
		if @center_image.save
			redirect_to dashboard_path
		else
			render 'new'
		end	
	end

	def update
		if @center_image.update_attributes(params[:center_image])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@center_image.destroy
		redirect_to dashboard_path
	end

	private
	
	def find_id
		@center_image = CenterImage.find(params[:id])
	end

end
