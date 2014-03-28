class ContactImagesController < ApplicationController
	before_filter :find_id, only: [:edit, :update, :destroy]

	def edit
	end

	def new
		@contact_image = ContactImage.new
	end

	def create
		@contact_image = ContactImage.new(params[:contact_image])
		if @contact_image.save
			redirect_to dashboard_path
		else
			render 'new'
		end	
	end

	def update
		if @contact_image.update_attributes(params[:contact_image])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@contact_image.destroy
		redirect_to dashboard_path
	end

	private
	
	def find_id
		@contact_image = ContactImage.find(params[:contact_image])
	end

end
