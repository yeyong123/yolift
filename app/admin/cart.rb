ActiveAdmin.register Cart do
	actions :all, except: [:new, :edit]

	#filter :line_items_product_id, label: "关联的产品", as: :select, collection: LineItem.all.collect {|line| [line.product_id, line.product_id]}
	filter :user_id, label: "用户", as: :select

	index do 
		selectable_column
		column "购物车序号" do |cart|
			cart.id
		end
		column "创建时间" do |cart|
			cart.created_at.strftime("%Y-%m-%d")
		end
		column "产品" do |cart|
			unless cart.line_items.empty?
				cart.line_items.first.product_id
			end
		end
		column "用户", sortable: 'user_id' do |cart|
			cart.user.email unless cart.user.nil?
		end
	end

end
