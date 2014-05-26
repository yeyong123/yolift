# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
# * url [string] - TODO: document me
class ProductImage < ActiveRecord::Base
  attr_accessible :image, :url, :image_product_id
	mount_uploader :image, ImageUploader
	belongs_to :image_product
end
