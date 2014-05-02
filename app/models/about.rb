# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * content [text] - TODO: document me
# * count [integer, default=0, limit=4] - TODO: document me
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * info [text] - TODO: document me
# * photo [string] - TODO: document me
# * title [string]
# * updated_at [datetime, not null] - last update time
class About < ActiveRecord::Base
  attr_accessible :content, :title, :count, :image, :photo, :info
	mount_uploader :image, ImageUploader
	mount_uploader :photo, ImageUploader
	validates :title,:content, presence: true
end
