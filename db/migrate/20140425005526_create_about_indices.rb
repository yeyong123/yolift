class CreateAboutIndices < ActiveRecord::Migration
  def change
    create_table :about_indices do |t|
      t.string :image
      t.string :info

      t.timestamps
    end
  end
end
