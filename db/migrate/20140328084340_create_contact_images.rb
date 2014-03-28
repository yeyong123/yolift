class CreateContactImages < ActiveRecord::Migration
  def change
    create_table :contact_images do |t|
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
