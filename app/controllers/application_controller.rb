class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :set_local_i18n
	before_filter :find_cart
	before_filter :authenticate_admin!, only: [:create, :edit,:new, :update, :destroy]

	
	unless Rails.application.config.consider_all_requests_local
		rescue_from Exception, with: lambda { |exception| render_error 500, exception }
		rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
	end	 		

	
	protected
	def set_local_i18n
		if params[:locale]
			if I18n.available_locales.include?(params[:locale].to_sym)
				I18n.locale = params[:locale]
			else
				flash.now[:notice] = "#{params[:locale]} 翻译不可用。"
				logger.error flash.now[:notice]
			end
		end
	end
	#		
	def default_url_options
		{locale: I18n.locale}
	end

	private

	def current_cart
		if user_signed_in? && current_user
			@cart = Cart.find_by_user_id(session[:user_id])
		else
			Cart.find(session[:cart_id])
		end
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
		@cart
	end

	def find_cart
		if user_signed_in? && current_user
			if current_user.cart.nil?
				@cart = current_user.create_cart
			else
				@cart = current_user.cart
			end
		else
			@cart = current_cart
		end
	end

	def render_error(status, exception)
		respond_to do |format|
			format.html { render template: "errors/#{status}", layout: 'layouts/application', status: status }
			format.all { render nothing: true, status: status }
		end
	end
end
