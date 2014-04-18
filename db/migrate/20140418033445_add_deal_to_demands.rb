class AddDealToDemands < ActiveRecord::Migration
  def change
    add_column :demands, :deal, :boolean, default: false
  end
end
