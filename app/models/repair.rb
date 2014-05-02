# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * address [string] - TODO: document me
# * company [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * deal [boolean, limit=1] - TODO: document me
# * head [string] - TODO: document me
# * headnumber [string] - TODO: document me
# * image [string] - TODO: document me
# * jobtime [string] - TODO: document me
# * name [string]
# * productdate [string] - TODO: document me
# * remark [text] - TODO: document me
# * repaircontent [text] - TODO: document me
# * say [text] - TODO: document me
# * telephone [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
class Repair < ActiveRecord::Base
  attr_accessible :address, :company, :head, :headnumber, :image, :jobtime, :name, :productdate, :remark, :repaircontent, :say, :telephone
	mount_uploader :image, ImageUploader
	validates_presence_of :company, :name, :address, :telephone, :head, :headnumber
end
