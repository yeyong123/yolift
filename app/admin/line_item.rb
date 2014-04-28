ActiveAdmin.register LineItem do
	actions :all, except: [:new, :edit]
	filter :cart_id, label: "购物车", as: :select
	filter :order, label: "订单"
	filter :quantity, label: "数量"

	index do 
		selectable_column 
		column "创建时间" do |line|
			line.created_at.strftime("%Y-%m-%d")
		end
		column "关联的产品" do |line|
			line.product.title unless line.product.nil?
		end
		column "数量" do |line|
			line.quantity
		end
		column "购物车" do |line|
			line.cart_id
		end

		default_actions
	end


end
