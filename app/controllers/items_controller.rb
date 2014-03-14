class ItemsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@items = Item.order("created_at desc").paginate(page: params[:page],per_page: 10)
	end

	def show
	end

	def edit
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(params[:item])
		if @item.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @item.update_attributes(params[:item])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to dashboard_path
	end

	private

	def find_id
		@item = Item.find(params[:id])
	end
end
