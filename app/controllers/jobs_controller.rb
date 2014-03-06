class JobsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@jobs = Job.order("id desc").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def edit
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(params[:job])
		if @job.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @job.update_attributes(params[:job])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@job.destroy
		redirect_to dashboard_path
	end

private
	
def find_id
	@job = Job.find(params[:id])
end
end
