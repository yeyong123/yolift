class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video
      t.integer :product_id

      t.timestamps
    end
  end
end
