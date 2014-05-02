# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * product_id [integer, limit=4] - belongs to :product
# * updated_at [datetime, not null] - last update time
class Photo < ActiveRecord::Base
  attr_accessible :image, :product_id
  belongs_to :product
  mount_uploader :image, ImageUploader
end
