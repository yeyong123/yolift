class CaseItemsController < ApplicationController
	before_filter :find_id, only: [:show]

	def index
		@case_items = CaseItem.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def new
		@case_item = CaseItem.new
	end

	

	private

	def find_id 
		@case_item = CaseItem.find(params[:id])
	end

end
