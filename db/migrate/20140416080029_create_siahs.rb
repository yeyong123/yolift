class CreateSiahs < ActiveRecord::Migration
  def change
    create_table :siahs do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
