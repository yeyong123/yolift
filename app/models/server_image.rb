# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
# * url [string] - TODO: document me
class ServerImage < ActiveRecord::Base
  attr_accessible :image, :url
	mount_uploader :image, ImageUploader
end
