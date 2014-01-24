class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :company
      t.string :name
      t.string :address
      t.string :telephone
      t.string :head
      t.string :headnumber
      t.string :productdate
      t.string :image
      t.text :repaircontent
      t.string :jobtime
      t.text :remark
      t.text :say

      t.timestamps
    end
  end
end
