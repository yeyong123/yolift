class List < ActiveRecord::Base
  attr_accessible :title
	has_many :guides, dependent: :destroy
end
