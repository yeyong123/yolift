class AddExcellentToProducts < ActiveRecord::Migration
  def change
    add_column :products, :excellent, :integer, default: 0
  end
end
