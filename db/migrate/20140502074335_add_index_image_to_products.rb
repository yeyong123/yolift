class AddIndexImageToProducts < ActiveRecord::Migration
  def change
    add_index :products, :paixu, unique: true
    add_index :products, :title
    add_index :products, :image
    add_index :categories, :name, unique: true
    add_index :tags, :name, unique: true
  end
end
