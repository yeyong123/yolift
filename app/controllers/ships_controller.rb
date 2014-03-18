class ShipsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@ships = Ship.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def edit
	end

	def new
		@ship = Ship.new
	end

	def create
		@ship = Ship.new(params[:ship])
		if @ship.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @ship.update_attributes(params[:ship])
			redirect_to dashboard_path(@ship)
		else
			render 'edit'
		end
	end

	def destroy
		@ship.destroy
		redirect_to dashboard_path
	end

	private

	def find_id
		@ship = Ship.find(params[:id])
	end
end
