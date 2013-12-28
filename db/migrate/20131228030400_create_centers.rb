class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
