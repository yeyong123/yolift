class Zixun < ActiveRecord::Base
  attr_accessible :content, :server_id, :title
	belongs_to :server
end
