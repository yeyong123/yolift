class CreateAboutImages < ActiveRecord::Migration
  def change
    create_table :about_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
