class BananersController < ApplicationController

	def index
		@bananers = Bananer.all
	end

	def new
		@bananer = Bananer.new
	end

	def show
		@bananer = Bananer.find(params[:id])
	end

	def edit
		@bananer = Bananer.find(params[:id])
	end
	def create
		@bananer = Bananer.new(params[:bananer])
		if @bananer.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end
	def update
		@bananer = Bananer.find(params[:id])
		if @bananer.update_attributes(params[:bananer])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end
	def destroy
		@bananer = Bananer.find(params[:id])
		@bananer.destroy
		redirect_to dashboard_path
	end
end
