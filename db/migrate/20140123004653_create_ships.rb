class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
