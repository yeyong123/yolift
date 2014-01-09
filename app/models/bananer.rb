class Bananer < ActiveRecord::Base
  attr_accessible :button, :descript, :image, :title
  mount_uploader :image, ImageUploader
	validates_presence_of :image
end
