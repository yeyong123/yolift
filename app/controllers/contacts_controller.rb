class ContactsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@contacts = Contact.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def show
		@affiliate = Affiliate.new
		@message = Message.new
	end

	def edit
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def update
		if @contact.update_attributes(params[:contact])
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@contact.destroy
		redirect_to dashboard_path
	end

	private

	def find_id
		@contact = Contact.find(params[:id])
	end
end
