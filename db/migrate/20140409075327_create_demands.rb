class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :company
      t.string :name
      t.string :email
      t.string :phone
      t.string :telphone
      t.text :question

      t.timestamps
    end
  end
end
