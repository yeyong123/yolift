ActiveAdmin.register Message do
	menu false
	actions :all, :except => [:edit,:new]
	filter :created_at, label: "时间"

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
	end

end
