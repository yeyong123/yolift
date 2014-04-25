class AboutIndex < ActiveRecord::Base
  attr_accessible :image, :info
	mount_uploader :image, ImageUploader

end
