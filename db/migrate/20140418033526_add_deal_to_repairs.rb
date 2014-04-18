class AddDealToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :deal, :boolean, default: false
  end
end
