class CreateCatelogImages < ActiveRecord::Migration
  def change
    create_table :catelog_images do |t|
      t.string :image
      t.integer :catelog_id

      t.timestamps
    end
  end
end
