class Productcolor < ActiveRecord::Base
  attr_accessible :color, :product_id
  belongs_to :product
end
