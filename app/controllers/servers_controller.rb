class ServersController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@servers = Server.order("created_at desc").paginate(page: params[:page], per_page: 12)
	end

	def show
		@zixuns = @server.zixuns.order("created_at desc").paginate(page: params[:page], per_page: 8)
	end

	def edit
	end

	def new
		@server = Server.new
	end

	def create
		@server = Server.new(params[:server])
		if @server.save
			redirect_to dashboard_path, notice: "#{@server.title}创建成功！"
		else
			render 'new'
		end
	end

	def update
		if @server.update_attributes(params[:server])
			redirect_to dashboard_path, notice: "#{@server.title}更新成功！"
		else
			render 'edit'
		end
	end

	def destroy
		@server.destroy
		redirect_to dashboard_path
	end

	protected

	def find_id
		@server = Server.find(params[:id])
	end
end
