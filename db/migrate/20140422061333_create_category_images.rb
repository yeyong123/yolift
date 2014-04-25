class CreateCategoryImages < ActiveRecord::Migration
  def change
    create_table :category_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
