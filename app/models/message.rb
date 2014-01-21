class Message < ActiveRecord::Base
  attr_accessible :company, :email, :name, :phone, :question, :telphone
end
