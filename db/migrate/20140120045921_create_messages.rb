class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :telphone
      t.string :phone
      t.text :question

      t.timestamps
    end
  end
end
