class PaymentsController < ApplicationController
	before_filter :find_id, only: [:show, :edit, :update, :destroy]

	def index
		@payments = Payment.order("id desc").paginate(page: params[:page],per_page: 10)
	end

	def show
	end

	def edit
	end

	def new
		@payment = Payment.new
	end

	def create
		@payment = Payment.new(params[:payment])
		if @payment.save
			redirect_to payments_path
		else
			render 'new'
		end
	end

	def update
		if @payment.update_attributes(params[:payment])
			redirect_to payment_path(@payment)
		else
			render 'edit'
		end
	end

	def destroy
		@payment.destroy
		redirect_to payments_path
	end

	private

	def find_id
		@payment = Payment.find(params[:id])
	end
end
