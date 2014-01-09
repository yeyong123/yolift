class Tag < ActiveRecord::Base
  attr_accessible :category_id, :name
  belongs_to :category
  has_many :products, dependent: :destroy
	validates_uniqueness_of :name

end
