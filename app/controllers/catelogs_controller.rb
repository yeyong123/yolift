class CatelogsController < ApplicationController
	skip_before_filter :authenticate_admin!
	before_filter :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy]
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
	@catelogs = Catelog.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
	end
	
	def edit
	end

	def new
		@catelog = Catelog.new
	end
	
	def create
		@catelog = Catelog.new(params[:catelog])
		if @catelog.save
			redirect_to root_path, notice: "感谢你的申请，我们会尽快给你邮寄样册？"
		else
			render 'new'
		end
	end

	def update
		if @catelog.update_attributes(params[:catelog])
			redirect_to catelogs_path, notice: "客户申请表修改成功"
		else
			render 'edit'
		end
	end
	
	def destroy
		@catelog.destroy
		redirect_to dashboard_path
	end

	private
	 def find_id
		 @catelog = Catelog.find(params[:id])
	 end
end
