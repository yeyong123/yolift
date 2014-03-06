class RepairsController < ApplicationController
	skip_before_filter :authenticate_admin!
	before_filter :authenticate_admin!, only: [:index, :show, :edit, :destroy]
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@repairs = Repair.order("id desc").paginate(page: params[:page],per_page: 10)
	end

	def show
	end
	
	def edit
	end
	
	def new
		@repair = Repair.new
	end

	def create
		@repair = Repair.new(params[:repair])
		if @repair.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @repair.update_attributes(params[:repair])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@repair.destroy
		redirect_to dashboard_path
	end

	private

	def find_id
		@repair = Repair.find(params[:id])
	end
end
