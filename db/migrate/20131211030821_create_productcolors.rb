class CreateProductcolors < ActiveRecord::Migration
  def change
    create_table :productcolors do |t|
      t.string :color
      t.integer :product_id

      t.timestamps
    end
  end
end
