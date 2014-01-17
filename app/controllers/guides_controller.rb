class GuidesController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@guides = Guide.all
	end

	def show
	end

	def edit
	end

	def new
		@guide = Guide.new
	end

	def create
		@guide = Guide.new(params[:guide])
		if @guide.save
			redirect_to guides_path
		else
			render 'new'
		end
	end

	def update
		if @guide.update_attributes(params[:guide])
			redirect_to guide_path(@guide)
		else
			render 'edit'
		end
	end

	def destroy
		@guide.destroy
		redirect_to guides_path
	end

	private

	def find_id
		@guide = Guide.find(params[:id])
	end
end
