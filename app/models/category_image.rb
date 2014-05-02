# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * category_id [integer, limit=4] - belongs to :category
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
# * url [string] - TODO: document me
class CategoryImage < ActiveRecord::Base
  attr_accessible :image, :url,:category_id
	belongs_to :category
	mount_uploader :image, ImageUploader
end
