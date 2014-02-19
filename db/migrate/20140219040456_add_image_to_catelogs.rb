class AddImageToCatelogs < ActiveRecord::Migration
  def change
    add_column :catelogs, :image, :string
  end
end
