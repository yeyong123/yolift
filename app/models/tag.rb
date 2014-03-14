class Tag < ActiveRecord::Base
  attr_accessible :category_id, :name, :image
  belongs_to :category
  has_many :products, dependent: :destroy
	validates_uniqueness_of :name
	mount_uploader :image, ImageUploader

end
