class CreateServerImages < ActiveRecord::Migration
  def change
    create_table :server_images do |t|
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
