class CaseItem < ActiveRecord::Base
  attr_accessible :content, :image, :item_id, :title
	belongs_to :item
	mount_uploader :image, ImageUploader
end
