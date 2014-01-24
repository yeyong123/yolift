class AftermarketsController < ApplicationController

	before_filter :find_id, only: [:show,:edit,:update, :destroy]

	def index
		@aftermarkets = Aftermarket.order("id desc").paginate(page: params[:page],per_page: 10)
	end

	def show
		@repair = Repair.new
	end

	def edit
	end

	def new
		@aftermarket = Aftermarket.new
	end
	
	def create
		@aftermarket = Aftermarket.new(params[:aftermarket])
		if @aftermarket.save
			redirect_to aftermarkets_path
		else
			render 'new'
		end
	end

	def update
		if @aftermarket.update_attributes(params[:aftermarket])
			redirect_to aftermarket_path(@aftermarket)
		else
			render 'edit'
		end
	end

	def destroy
		@aftermarket.destroy
		redirect_to aftermarkets_path
	end

	private

	def find_id 
		@aftermarket = Aftermarket.find(params[:id])
	end

end
