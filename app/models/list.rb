class List < ActiveRecord::Base
  attr_accessible :title, :image
	has_many :guides, dependent: :destroy
	mount_uploader :image, ImageUploader
end
