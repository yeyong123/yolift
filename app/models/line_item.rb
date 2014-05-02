# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * cart_id [integer, limit=4] - belongs to :cart
# * created_at [datetime, not null] - creation time
# * order_id [integer, limit=4] - belongs to :order
# * product_id [integer, limit=4] - belongs to :product
# * quantity [integer, default=1, limit=4] - TODO: document me
# * updated_at [datetime, not null] - last update time
class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :productnumber_ids, :order_id, :quantity
  belongs_to :product
  belongs_to :cart
  has_many :productnumbers
	belongs_to :order

end
