class About < ActiveRecord::Base
  attr_accessible :content, :title, :count, :image, :photo, :info
	mount_uploader :image, ImageUploader
	mount_uploader :photo, ImageUploader
	validates :title,:content, presence: true
end
