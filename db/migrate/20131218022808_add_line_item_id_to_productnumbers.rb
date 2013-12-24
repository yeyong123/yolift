class AddLineItemIdToProductnumbers < ActiveRecord::Migration
  def change
    add_column :productnumbers, :line_item_id, :integer
  end
end
