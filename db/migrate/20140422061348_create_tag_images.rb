class CreateTagImages < ActiveRecord::Migration
  def change
    create_table :tag_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
