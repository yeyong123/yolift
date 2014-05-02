# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * catelog_id [integer, limit=4] - TODO: document me
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
class CatelogImage < ActiveRecord::Base
  attr_accessible :catelog_id, :image
	mount_uploader :image, ImageUploader
end
