class AddPersonToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :person, :string
  end
end
