class AddImageToTags < ActiveRecord::Migration
  def change
    add_column :tags, :image, :string
  end
end
