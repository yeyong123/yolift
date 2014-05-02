# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * desc [string] - TODO: document me
# * name [string]
# * updated_at [datetime, not null] - last update time
class Siah < ActiveRecord::Base
  attr_accessible :desc, :name
end
