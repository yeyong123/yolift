# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * title [string]
# * updated_at [datetime, not null] - last update time
class List < ActiveRecord::Base
  attr_accessible :title, :image
	has_many :guides, dependent: :destroy
	mount_uploader :image, ImageUploader
end
