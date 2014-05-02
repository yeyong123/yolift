# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * line_item_id [integer, limit=4] - belongs to :line_item
# * number [string] - TODO: document me
# * product_id [integer, limit=4] - belongs to :product
# * updated_at [datetime, not null] - last update time
class Productnumber < ActiveRecord::Base
  attr_accessible :number, :product_id,:quantity, :line_item_id
  belongs_to :product
  belongs_to :line_item
end
