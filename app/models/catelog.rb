# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * address [string] - TODO: document me
# * city_id [integer, limit=4] - belongs to :city
# * company [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * deal [boolean, limit=1] - TODO: document me
# * district_id [integer, limit=4] - belongs to :district
# * email [string]
# * image [string] - TODO: document me
# * interest [string] - TODO: document me
# * mobel [string] - TODO: document me
# * name [string]
# * number [integer, limit=4] - TODO: document me
# * phone [string] - TODO: document me
# * province_id [integer, limit=4] - belongs to :province
# * scale [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
# * zip [string] - TODO: document me
class Catelog < ActiveRecord::Base
  attr_accessible :address, :deal,:city_id, :company, :district_id, :image,:email, :interest, :mobel, :name, :number, :phone, :province_id, :scale, :zip
	belongs_to :province
	belongs_to :city
	belongs_to :district

	Scale = ["30人以下","31-50人", "51-100人", "101-150人"]
	mount_uploader :image, ImageUploader

	validates_presence_of :company, :name, :address, :mobel, :number
	validates_numericality_of :number, only_integer: true, greater_than: 0, less_than: 5
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	validates_inclusion_of :scale, in: Scale
	validates_length_of :interest, maximum: 30
end
