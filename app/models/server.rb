class Server < ActiveRecord::Base
  attr_accessible :content, :title
	has_many :zixuns
end
