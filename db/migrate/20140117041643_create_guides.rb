class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :title
      t.text :content
      t.integer :list_id

      t.timestamps
    end
  end
end
