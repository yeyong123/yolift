class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :address
      t.string :department
      t.text :content

      t.timestamps
    end
  end
end
