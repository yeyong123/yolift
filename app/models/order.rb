# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * address [string] - TODO: document me
# * city_id [integer, limit=4] - belongs to :city
# * company [string] - TODO: document me
# * content [text] - TODO: document me
# * created_at [datetime, not null] - creation time
# * deal [boolean, limit=1] - TODO: document me
# * district_id [integer, limit=4] - belongs to :district
# * email [string]
# * name [string]
# * ordernumber [string] - TODO: document me
# * phone [string] - TODO: document me
# * product_id [integer, limit=4] - TODO: document me
# * province_id [integer, limit=4] - belongs to :province
# * updated_at [datetime, not null] - last update time
class Order < ActiveRecord::Base
	attr_accessible :address, :company, :deal,:content, :email, :name, :ordernumber, :phone, :city_id, :province_id, :district_id
	has_many :line_items, dependent: :destroy
	belongs_to :province
	belongs_to :city
	belongs_to :district

	
	validates_presence_of :address, :company, :email, :phone
	validates_numericality_of :phone
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	validates_length_of :content, maximum: 140, allow_blank: true


	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end


end
