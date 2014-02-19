class CreateCatelogs < ActiveRecord::Migration
  def change
    create_table :catelogs do |t|
      t.string :company
      t.string :name
      t.string :address
      t.string :zip
      t.string :mobel
      t.string :phone
      t.string :email
      t.string :scale
      t.integer :number
      t.string :interest
      t.integer :province_id
      t.integer :city_id
      t.integer :district_id

      t.timestamps
    end
  end
end
