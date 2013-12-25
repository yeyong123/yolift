class Category < ActiveRecord::Base
  attr_accessible :name, :tags_attributes
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: :true, 
	  reject_if: proc{ |attrs| attrs.all? { |k,v| v.blank? }}
end
