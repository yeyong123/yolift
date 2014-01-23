class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
