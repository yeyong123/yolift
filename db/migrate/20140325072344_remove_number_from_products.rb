class RemoveNumberFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :number
  end

  def down
    add_column :products, :number, :string
  end
end
