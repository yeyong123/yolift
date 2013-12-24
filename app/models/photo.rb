class Photo < ActiveRecord::Base
  attr_accessible :image, :product_id
  belongs_to :product
  mount_uploader :image, ImageUploader
end
