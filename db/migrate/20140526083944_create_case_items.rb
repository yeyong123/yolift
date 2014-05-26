class CreateCaseItems < ActiveRecord::Migration
	def change 
		create_table :case_items do |t|
			t.string :image
			t.string :title
			t.text	 :content
			t.integer :item_id
			t.timestamps
		end
	end
end
