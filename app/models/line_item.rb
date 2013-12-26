class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :productnumber_ids, :order_id, :quantity
  belongs_to :product
  belongs_to :cart
  has_many :productnumbers
	belongs_to :order
end
