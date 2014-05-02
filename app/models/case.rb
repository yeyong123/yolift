# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * content [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * item_id [integer, limit=4] - belongs to :item
# * title [string]
# * updated_at [datetime, not null] - last update time
class Case < ActiveRecord::Base
  attr_accessible :content, :image, :item_id, :title
	belongs_to :item
	mount_uploader :image, ImageUploader
end
