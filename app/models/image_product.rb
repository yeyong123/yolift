class ImageProduct < ActiveRecord::Base
  attr_accessible :id,:product_images_attributes
	has_many :product_images, dependent: :destroy
	accepts_nested_attributes_for :product_images, allow_destroy: true, update_only: true, reject_if: proc{|attrs| attrs.all? {|k,v| v.blank?}}
end
