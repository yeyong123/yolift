class Category < ActiveRecord::Base
  attr_accessible :name, :tags_attributes, :image
  has_many :tags, dependent: :destroy
	has_many :products, through: :tags
  accepts_nested_attributes_for :tags, allow_destroy: :true, 
	  reject_if: proc{ |attrs| attrs.all? { |k,v| v.blank? }}
	validates_uniqueness_of :name
	validates_presence_of :name
	mount_uploader :image, ImageUploader
	
	def name_with_initial
		"#{name}"
	end
end
