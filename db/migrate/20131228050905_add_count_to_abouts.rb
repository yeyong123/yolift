class AddCountToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :count, :integer, default: 0
  end
end
