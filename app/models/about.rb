class About < ActiveRecord::Base
  attr_accessible :content, :title, :count, :image
	mount_uploader :image, ImageUploader
	validates :title,:content, presence: true
end
