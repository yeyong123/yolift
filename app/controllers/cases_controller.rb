class CasesController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@cases = Case.order("id desc").paginate(page: params[:page],per_page: 10)
	end

	def show
	end
	
	def edit
	end

	def new
		@case = Case.new
	end

	def create
		@case = Case.new(params[:case])
		if @case.save
			redirect_to cases_path
		else
			render 'new'
		end
	end

	def update
		if @case.update_attributes(params[:case])
			redirect_to case_path(@case)
		else
			render 'edit'
		end
	end

	def destroy
		@case.destroy
		redirect_to cases_path
	end

	private

	def find_id
		@case = Case.find(params[:id])
	end
end
