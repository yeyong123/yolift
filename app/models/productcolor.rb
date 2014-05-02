# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * color [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * product_id [integer, limit=4] - belongs to :product
# * updated_at [datetime, not null] - last update time
class Productcolor < ActiveRecord::Base
  attr_accessible :color, :product_id
  belongs_to :product
end
