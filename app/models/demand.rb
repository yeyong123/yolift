# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * company [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * deal [boolean, limit=1] - TODO: document me
# * email [string]
# * name [string]
# * phone [string] - TODO: document me
# * question [text] - TODO: document me
# * telphone [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
class Demand < ActiveRecord::Base
  attr_accessible :company, :email, :name, :phone, :deal,:question, :telphone
end
