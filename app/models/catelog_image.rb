class CatelogImage < ActiveRecord::Base
  attr_accessible :catelog_id, :image
	mount_uploader :image, ImageUploader
end
