class AddInfoToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :info, :text
  end
end
