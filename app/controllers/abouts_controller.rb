class AboutsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@abouts = About.order("id desc").paginate(page: params[:page], per_page: 12)
	end

	def show
		@about.increment!(:count)
		@jobs = Job.all
	end

	def edit
	end

	def new
		@about = About.new
	end

	def create
		@about = About.new(params[:about])
		if @about.save
			redirect_to dashboard_path, notice: "创建关于我们目录成功！"
		else
			render 'new'
		end
	end

	def update
		if @about.update_attributes(params[:about])
			redirect_to dashboard_path, notice: "#{@about.title}  更新成功"
		else
			render 'edit'
		end
	end

	def destroy
		@about.destroy
		redirect_to dashboard_path
	end

	protected

	def find_id
		@about = About.find(params[:id])
	end
end
