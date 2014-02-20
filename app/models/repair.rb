class Repair < ActiveRecord::Base
  attr_accessible :address, :company, :head, :headnumber, :image, :jobtime, :name, :productdate, :remark, :repaircontent, :say, :telephone
	mount_uploader :image, ImageUploader
	validates_presence_of :company, :name, :address, :telephone, :head, :headnumber
end
