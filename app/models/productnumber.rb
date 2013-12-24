class Productnumber < ActiveRecord::Base
  attr_accessible :number, :product_id,:quantity, :line_item_id
  belongs_to :product
  belongs_to :line_item
end
