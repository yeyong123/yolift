class CreateAftermarkets < ActiveRecord::Migration
  def change
    create_table :aftermarkets do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
