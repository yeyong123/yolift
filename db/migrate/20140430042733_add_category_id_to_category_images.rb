class AddCategoryIdToCategoryImages < ActiveRecord::Migration
  def change
    add_column :category_images, :category_id, :integer
  end
end
