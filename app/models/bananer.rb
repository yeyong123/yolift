class Bananer < ActiveRecord::Base
  attr_accessible :button, :descript, :image, :title
  mount_uploader :image, ImageUploader
end
