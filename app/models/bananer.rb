class Bananer < ActiveRecord::Base
  attr_accessible :button, :descript, :image, :title, :number
  mount_uploader :image, ImageUploader
	validates_presence_of :image
	default_scope order("number desc")
	validates_numericality_of :number
end
