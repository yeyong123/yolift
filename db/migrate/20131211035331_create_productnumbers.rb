class CreateProductnumbers < ActiveRecord::Migration
  def change
    create_table :productnumbers do |t|
      t.string :number
      t.integer :product_id

      t.timestamps
    end
  end
end
