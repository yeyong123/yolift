class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :number
      t.string :printpdf
      t.string :video
      t.text :listtext
      t.text :techparams
      t.text :detail

      t.timestamps
    end
  end
end
