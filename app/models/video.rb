# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * product_id [integer, limit=4] - belongs to :product
# * updated_at [datetime, not null] - last update time
# * video [string] - TODO: document me
class Video < ActiveRecord::Base
  attr_accessible :product_id, :video
	belongs_to :product
	mount_uploader :video, VideoUploader
end
