class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
