class AddDealToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :deal, :boolean,default: false
  end
end
