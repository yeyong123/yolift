class ContactsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]
	def index
		@contacts = Contact.all
	end

	def show
	end

	def edit
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			redirect_to contacts_path
		else
			render 'new'
		end
	end

	def update
		if @contact.update_attributes(params[:contact])
			redirect_to contact_path
		else
			render 'edit'
		end
	end

	def destroy
		@contact.destroy
		redirect_to contacts_path
	end

	private

	def find_id
		@contact = Contact.find(params[:id])
	end
end
