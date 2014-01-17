class Guide < ActiveRecord::Base
  attr_accessible :content, :list_id, :title
	belongs_to :list
end
