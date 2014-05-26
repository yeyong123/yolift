class AddImageProductIdToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :image_product_id, :integer
  end
end
