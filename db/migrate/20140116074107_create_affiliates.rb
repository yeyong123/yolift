class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :company
      t.string :ownship
      t.string :capital
      t.string :contact
      t.datetime :founded
      t.string :telephone
      t.string :employees
      t.string :email
      t.string :address
      t.string :business
      t.string :distribution
      t.text :apply
      t.string :sales
      t.string :commitsales
      t.string :store
      t.string :owned
      t.string :warehouse
      t.string :rented
      t.string :salesstaff
      t.string :servicestaff
      t.string :affiliated
      t.text :currently
      t.string :intention

      t.timestamps
    end
  end
end
