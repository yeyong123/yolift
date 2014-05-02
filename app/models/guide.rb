# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * content [text] - TODO: document me
# * created_at [datetime, not null] - creation time
# * list_id [integer, limit=4] - belongs to :list
# * title [string]
# * updated_at [datetime, not null] - last update time
class Guide < ActiveRecord::Base
  attr_accessible :content, :list_id, :title
	belongs_to :list
end
