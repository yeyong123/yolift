class CreateBananers < ActiveRecord::Migration
  def change
    create_table :bananers do |t|
      t.string :image
      t.string :descript
      t.string :button
      t.string :title

      t.timestamps
    end
  end
end
