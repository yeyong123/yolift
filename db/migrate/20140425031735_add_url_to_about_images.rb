class AddUrlToAboutImages < ActiveRecord::Migration
  def change
    add_column :about_images, :url, :string
  end
end
