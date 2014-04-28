class AddDealToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :deal, :boolean, default: false
  end
end
