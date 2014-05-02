# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * address [string] - TODO: document me
# * content [text] - TODO: document me
# * created_at [datetime, not null] - creation time
# * department [string] - TODO: document me
# * title [string]
# * updated_at [datetime, not null] - last update time
class Job < ActiveRecord::Base
  attr_accessible :address, :content, :department, :title
end
