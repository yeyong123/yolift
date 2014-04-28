ActiveAdmin.register Demand do
	config.batch_actions = false
	menu false
	actions :all, except: [:new, :edit]
	filter :created_at, label: "创建时间"
	filter :deal,label: "处理", as: :check_boxes

	index do
		selectable_column
		column "序号" do |demand|
			demand.id
		end
		column "公司" do |demand|
			demand.company
		end
		column "姓名" do |demand|
			link_to demand.name, admin_demand_path(demand)
		end
		column "邮箱" do |demand|
			demand.email
		end
		column "手机" do |demand|
			demand.phone
		end
		 column "处理" do |demand|
			 if !demand.deal?
				 link_to "未处理", admin_demand_path(demand)
			 else
				 span :class => "deal-color" do
					 "已处理"
					end
			 end
		 end
	end


	show do
		render 'demands/show'
	end
end
