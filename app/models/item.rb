# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * title [string]
# * updated_at [datetime, not null] - last update time
class Item < ActiveRecord::Base
  attr_accessible :title
	has_many :cases
end
