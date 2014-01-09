class Order < ActiveRecord::Base
	attr_accessible :address, :company, :content, :email, :name, :ordernumber, :phone, :city_id, :province_id, :district_id
	has_many :line_items, dependent: :destroy
	belongs_to :province
	belongs_to :city
	belongs_to :district

	
	validates_presence_of :address, :company, :email, :phone
	validates_numericality_of :phone
	

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end


end
