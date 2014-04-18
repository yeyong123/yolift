class AddDealToCatelogs < ActiveRecord::Migration
  def change
    add_column :catelogs, :deal, :boolean, default: false
  end
end
