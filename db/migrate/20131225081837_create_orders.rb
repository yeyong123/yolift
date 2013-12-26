class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :company
      t.string :email
      t.string :phone
      t.string :address
      t.string :name
      t.text :content
      t.string :ordernumber

      t.timestamps
    end
  end
end
