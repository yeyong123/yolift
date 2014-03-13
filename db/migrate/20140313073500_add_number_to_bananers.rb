class AddNumberToBananers < ActiveRecord::Migration
  def change
    add_column :bananers, :number, :integer, default: 1
  end
end
