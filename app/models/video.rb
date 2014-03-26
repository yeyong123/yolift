class Video < ActiveRecord::Base
  attr_accessible :product_id, :video
	belongs_to :product
	mount_uploader :video, VideoUploader
end
