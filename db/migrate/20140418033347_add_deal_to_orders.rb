class AddDealToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :deal, :boolean, default: false
  end
end
