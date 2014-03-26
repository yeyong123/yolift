class RemoveVideoFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :video
  end

  def down
    add_column :products, :video, :string
  end
end
