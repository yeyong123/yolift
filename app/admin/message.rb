ActiveAdmin.register Message do
	menu false
	actions :all, :except => [:edit,:new]
	filter :created_at, label: "时间"
	filter :deal, label: "处理", as: :check_boxes

	index do
		selectable_column
		column "时间" do |mess|
			mess.created_at
		end
		column "公司" do |mess|
			mess.company
		end
		column "姓名" do |mess|
			link_to mess.name, admin_message_path(mess)
		end
		column "邮箱" do |mess|
			mess.email
		end
		column "电话" do |mess|
			mess.phone
		end
		column "处理" do |mess|
			if !mess.deal?
				link_to "未处理",admin_message_path(mess)
			else
				span :class => "deal-color" do
					"已处理"
				end
			end
		end
	end

end
