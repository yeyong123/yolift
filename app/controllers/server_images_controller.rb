class ServerImagesController < ApplicationController
	before_filter :find_id, only: [:edit, :update, :destroy]

	def edit
	end

	def new
		@server_image = ServerImage.new
	end

	def create
		@server_image = ServerImage.new(params[:server_image])
		if @server_image.save
			redirect_to dashboard_path
		else
			render 'new'
		end	
	end

	def update
		if @server_image.update_attributes(params[:server_image])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@server_image.destroy
		redirect_to dashboard_path
	end

	private
	
	def find_id
		@server_image = ServerImage.find(params[:id])
	end
end
