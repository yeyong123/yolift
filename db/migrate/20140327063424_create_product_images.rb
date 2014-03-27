class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
