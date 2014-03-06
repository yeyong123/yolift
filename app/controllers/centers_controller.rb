class CentersController < ApplicationController
	before_filter :authenticate_admin!, only: [:destory]
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@centers = Center.order("updated_at desc").paginate(page: params[:page], per_page: 12)
	end
	
	def show
	end

	def edit
	end

	def new
		@center = Center.new
	end

	def create
		@center = Center.new(params[:center])
		if @center.save
			redirect_to dashboard_path, notice: "#{@center.title}  创建成功！"
		else
			render 'new'
		end
	end

	def update
		if @center.update_attributes(params[:center])
			redirect_to dashboard_path, notice: "#{@center.title}  更新成功"
		else
			render 'edit'
		end
	end

	def destroy
		@center.destroy
		redirect_to :back
	end
	protected

	def find_id
		@center = Center.find(params[:id])
	end

end
