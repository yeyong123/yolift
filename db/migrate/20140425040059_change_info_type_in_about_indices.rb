class ChangeInfoTypeInAboutIndices < ActiveRecord::Migration
  def up
		change_table :about_indices do |t|
			t.change :info, :text
		end
  end

  def down
  end
end
