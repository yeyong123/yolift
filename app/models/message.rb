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
class Message < ActiveRecord::Base
  attr_accessible :company, :email, :name, :deal,:phone, :question, :telphone
	validates_presence_of  :name, :phone
	validates_numericality_of :phone
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, allow_blank: true
	validates_length_of :question, maximum: 140, minimum: 20, allow_blank: true
end
