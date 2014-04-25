class AddUrlToTagImages < ActiveRecord::Migration
  def change
    add_column :tag_images, :url, :string
  end
end
