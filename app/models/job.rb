class Job < ActiveRecord::Base
  attr_accessible :address, :content, :department, :title
end
