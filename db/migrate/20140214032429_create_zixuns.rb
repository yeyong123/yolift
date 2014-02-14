class CreateZixuns < ActiveRecord::Migration
  def change
    create_table :zixuns do |t|
      t.string :title
      t.text :content
      t.integer :server_id

      t.timestamps
    end
  end
end
