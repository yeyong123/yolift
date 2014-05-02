# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * content [text] - TODO: document me
# * created_at [datetime, not null] - creation time
# * title [string]
# * updated_at [datetime, not null] - last update time
class Center < ActiveRecord::Base
  attr_accessible :content, :title
end
