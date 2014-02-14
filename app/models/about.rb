class About < ActiveRecord::Base
  attr_accessible :content, :title, :count, :image
	mount_uploader :image, ImageUploader
end
