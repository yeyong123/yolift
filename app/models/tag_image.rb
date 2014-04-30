class TagImage < ActiveRecord::Base
  attr_accessible :image, :url, :tag_id
	belongs_to :tag
	mount_uploader :image, ImageUploader
end
