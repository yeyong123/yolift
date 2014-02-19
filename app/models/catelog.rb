class Catelog < ActiveRecord::Base
  attr_accessible :address, :city_id, :company, :district_id, :image,:email, :interest, :mobel, :name, :number, :phone, :province_id, :scale, :zip
	belongs_to :province
	belongs_to :city
	belongs_to :district
	validates_presence_of :company, :name, :address, :mobel
	Scale = ["30人以下","31-50人", "51-100人", "101-150人"]
	mount_uploader :image, ImageUploader
end
