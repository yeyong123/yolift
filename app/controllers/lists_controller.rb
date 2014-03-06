class ListsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@lists = List.all
	end

	def show

	end

	def edit
	end
	
	def new
		@list = List.new
	end

	def create
		@list = List.new(params[:list])
		if @list.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @list.update_attributes(params[:list])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@list.destroy
		redirect_to dashboard_path
	end

	private

	def find_id
		@list = List.find(params[:id])
	end
end
