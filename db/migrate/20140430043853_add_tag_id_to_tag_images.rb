class AddTagIdToTagImages < ActiveRecord::Migration
  def change
    add_column :tag_images, :tag_id, :integer
  end
end
