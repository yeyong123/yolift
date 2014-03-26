class VideosController < ApplicationController

	def index
		@videos = Video.order("id desc").paginate(page: params[:page], per_page: 8)
	end

	def show
		@video = Video.find(params[:id])
	end
end
