class Repair < ActiveRecord::Base
  attr_accessible :address, :company, :head, :headnumber, :image, :jobtime, :name, :productdate, :remark, :repaircontent, :say, :telephone
	mount_uploader :image, ImageUploader
end
