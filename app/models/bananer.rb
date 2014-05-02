# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * button [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * descript [string] - TODO: document me
# * image [string] - TODO: document me
# * number [integer, default=1, limit=4] - TODO: document me
# * title [string]
# * updated_at [datetime, not null] - last update time
class Bananer < ActiveRecord::Base
  attr_accessible :button, :descript, :image, :title, :number
  mount_uploader :image, ImageUploader
	validates_presence_of :image
	default_scope order("number desc")
	validates_numericality_of :number
end
