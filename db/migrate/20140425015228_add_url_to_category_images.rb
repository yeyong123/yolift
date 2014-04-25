class AddUrlToCategoryImages < ActiveRecord::Migration
  def change
    add_column :category_images, :url, :string
  end
end
