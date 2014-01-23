class Item < ActiveRecord::Base
  attr_accessible :title
	has_many :cases
end
