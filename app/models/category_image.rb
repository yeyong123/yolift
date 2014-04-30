class CategoryImage < ActiveRecord::Base
  attr_accessible :image, :url,:category_id
	belongs_to :category
	mount_uploader :image, ImageUploader
end
