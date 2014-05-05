class AddPictureToProducts < ActiveRecord::Migration
  def change
    add_column :products, :picture, :string
		add_column :products, :document, :string
		add_index :products, :document, unique: true
  end
end
