class ZixunsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@zixuns = Zixun.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def edit
	end

	def new
		@zixun = Zixun.new
	end

	def create
		@zixun = Zixun.new(params[:zixun])
		if @zixun.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @zixun.update_attributes(params[:zixun])
			redirect_to dashboard_path
			else
				render 'edit'
			end
	end

	def destroy
		@zixun.destroy
		redirect_to :back
	end

	private
	
	def find_id
		@zixun = Zixun.find(params[:id])
	end

end
