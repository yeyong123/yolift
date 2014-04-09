class DemandsController < ApplicationController
	skip_before_filter :authenticate_admin!
	before_filter :authenticate_admin!, only: [:index, :show, :edit, :destroy]
	before_filter :find_id, only:[:show, :edit, :update, :destroy]

	def index
		@demands = Demand.order('created_at desc').paginate(page: params[:page], per_page: 10)
	end

	def new
		@demand = Demand.new
	end

	def create
		@demand = Demand.new(params[:demand])
		if @demand.save
			redirect_to :back, notice: "感谢您的填写，我们会尽快答复！"
		else
			render 'new'
		end
	end

	def destroy
		@demand.destroy
		redirect_to :back
	end

	private

	def find_id
		@demand = Demand.find(params[:id])
	end

end
