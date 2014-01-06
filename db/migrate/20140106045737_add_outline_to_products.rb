class AddOutlineToProducts < ActiveRecord::Migration
  def change
    add_column :products, :outline, :text
  end
end
