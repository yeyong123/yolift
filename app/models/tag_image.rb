# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * tag_id [integer, limit=4] - belongs to :tag
# * updated_at [datetime, not null] - last update time
# * url [string] - TODO: document me
class TagImage < ActiveRecord::Base
  attr_accessible :image, :url, :tag_id
	belongs_to :tag
	mount_uploader :image, ImageUploader
end
