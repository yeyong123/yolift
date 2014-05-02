# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * info [text] - TODO: document me
# * updated_at [datetime, not null] - last update time
class AboutIndex < ActiveRecord::Base
  attr_accessible :image, :info
	mount_uploader :image, ImageUploader

end
