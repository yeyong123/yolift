# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * content [text] - TODO: document me
# * created_at [datetime, not null] - creation time
# * server_id [integer, limit=4] - belongs to :server
# * title [string]
# * updated_at [datetime, not null] - last update time
class Zixun < ActiveRecord::Base
  attr_accessible :content, :server_id, :title
	belongs_to :server
end
