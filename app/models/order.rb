class Order < ActiveRecord::Base
  attr_accessible :address, :company, :content, :email, :name, :ordernumber, :phone
	has_many :line_items, dependent: :destroy

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end


end
