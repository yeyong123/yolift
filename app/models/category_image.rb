class CategoryImage < ActiveRecord::Base
  attr_accessible :image, :url
	mount_uploader :image, ImageUploader
end