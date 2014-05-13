class RemoveIndexFromProducts < ActiveRecord::Migration
  def up
		remove_index :products, :document
  end

  def down
  end
end
