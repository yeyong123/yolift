# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * address [string] - TODO: document me
# * affiliated [string] - TODO: document me
# * apply [text] - TODO: document me
# * business [string] - TODO: document me
# * capital [string] - TODO: document me
# * commitsales [string] - TODO: document me
# * company [string] - TODO: document me
# * contact [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * currently [text] - TODO: document me
# * deal [boolean, limit=1] - TODO: document me
# * distribution [string] - TODO: document me
# * email [string]
# * employees [string] - TODO: document me
# * founded [datetime] - TODO: document me
# * intention [string] - TODO: document me
# * owned [string] - TODO: document me
# * ownship [string] - TODO: document me
# * person [string] - TODO: document me
# * rented [string] - TODO: document me
# * sales [string] - TODO: document me
# * salesstaff [string] - TODO: document me
# * servicestaff [string] - TODO: document me
# * store [string] - TODO: document me
# * telephone [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
# * warehouse [string] - TODO: document me
class Affiliate < ActiveRecord::Base
  attr_accessible :address, :deal,:affiliated, :apply,:person, :business, :capital, :commitsales, :company, :contact, :currently, :distribution, :email, :employees, :founded, :intention, :owned, :ownship, :rented, :sales, :salesstaff, :servicestaff, :store, :telephone, :warehouse
	
	validates_presence_of :company, :contact, :telephone, :email, :address
	validates_uniqueness_of :company, :address, :telephone, :email
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	validates_numericality_of :employees, :salesstaff, :servicestaff, :affiliated, greater_than: 3, only_integer: true, allow_blank: true
	validates_numericality_of :store, :warehouse, greater_than: 100, allow_blank: true
end
