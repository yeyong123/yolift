class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :productnumber_ids
  belongs_to :product
  belongs_to :cart
  has_many :productnumbers
end
