class AddPaixuToProducts < ActiveRecord::Migration
  def change
    add_column :products, :paixu, :integer, default: 0
  end
end
