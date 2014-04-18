class Affiliate < ActiveRecord::Base
  attr_accessible :address, :deal,:affiliated, :apply,:person, :business, :capital, :commitsales, :company, :contact, :currently, :distribution, :email, :employees, :founded, :intention, :owned, :ownship, :rented, :sales, :salesstaff, :servicestaff, :store, :telephone, :warehouse
	
	validates_presence_of :company, :contact, :telephone, :email, :address
	validates_uniqueness_of :company, :address, :telephone, :email
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	validates_numericality_of :employees, :salesstaff, :servicestaff, :affiliated, greater_than: 3, only_integer: true, allow_blank: true
	validates_numericality_of :store, :warehouse, greater_than: 100, allow_blank: true
end
