class AffiliatesController < ApplicationController
before_filter :authenticate_admin!, only: [:index,:show, :edit, :update, :destroy]

	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@affiliates = Affiliate.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def edit
	end
	
	def new
		@affiliate = Affiliate.new
	end

	def create
		@affiliate = Affiliate.new(params[:affiliate])
		if @affiliate.save
			redirect_to root_path,notice: "感谢你的申请，我们会马上回复你，请保持电话畅通！"
		else
			render 'new'
		end
	end

	def update
		if @affiliate.update_attributes(params[:affiliate])
			redirect_to affiliate_path(@affiliate)
		else
			render 'edit'
		end
	end

	def destroy
		@affiliate.destroy
		redirect_to affiliates_path
	end

	private

	def find_id
		@affiliate = Affiliate.find(params[:id])
	end
end
