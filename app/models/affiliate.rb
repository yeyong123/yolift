class Affiliate < ActiveRecord::Base
  attr_accessible :address, :affiliated, :apply,:person, :business, :capital, :commitsales, :company, :contact, :currently, :distribution, :email, :employees, :founded, :intention, :owned, :ownship, :rented, :sales, :salesstaff, :servicestaff, :store, :telephone, :warehouse
	validates :company, :contact, :address, presence: true
end
