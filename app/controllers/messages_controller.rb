class MessagesController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@messages = Message.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show

	end

	def edit
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message])
		if @message.save
			redirect_to root_path, notice: "感谢你建议！"
		else
			render 'new'
		end
	end

	def update
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

	private

	def find_id
		@message = Message.find(params[:id])
	end

end
