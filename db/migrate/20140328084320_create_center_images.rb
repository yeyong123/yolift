class CreateCenterImages < ActiveRecord::Migration
  def change
    create_table :center_images do |t|
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
