class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :image
      t.string :title
      t.string :content
      t.integer :item_id

      t.timestamps
    end
  end
end
