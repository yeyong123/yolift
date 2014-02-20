class Message < ActiveRecord::Base
  attr_accessible :company, :email, :name, :phone, :question, :telphone
	validates_presence_of  :name, :phone
	validates_numericality_of :phone
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, allow_blank: true
	validates_length_of :question, maximum: 140, minimum: 20, allow_blank: true
end
