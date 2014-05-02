# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * category_id [integer, limit=4] - belongs to :category
# * created_at [datetime, not null] - creation time
# * image [string] - TODO: document me
# * name [string]
# * updated_at [datetime, not null] - last update time
class Tag < ActiveRecord::Base
  attr_accessible :category_id, :name, :image
  belongs_to :category
  has_many :products, dependent: :destroy
	has_many :tag_images
	validates_uniqueness_of :name
	mount_uploader :image, ImageUploader

end
