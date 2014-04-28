ActiveAdmin.register Order do
	config.batch_actions = false
	actions :all, :except => [:new, :edit]
	filter :email, label: "邮箱"
	filter :name, label: "姓名"
	filter :created_at, label: "申请时间"
	filter :deal, label: "处理", as: :check_boxes

	index do
		selectable_column 
		column "序号" do |order|
			order.id
		end
		column "申请时间" do |order|
			order.created_at.strftime("%Y-%m-%d")
		end
		column "姓名" do |order|
		link_to  order.name, admin_order_path(order)
		end	 


		column "手机" do |order|
			order.phone
		end
		column "处理" do |order|
			if !order.deal?
				link_to "待处理", admin_order_path(order)
			else
				span :class => "deal-color" do
					"已处理"
				end
			end
		end
	end

	show do
		render 'orders/show'
	end

end
