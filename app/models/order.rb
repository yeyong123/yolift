class Order < ActiveRecord::Base
  attr_accessible :address, :company, :content, :email, :name, :ordernumber, :phone
end
