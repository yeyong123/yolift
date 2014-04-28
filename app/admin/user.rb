ActiveAdmin.register User do
	filter :created_at, label: "创建时间"
	index do 
		selectable_column
		column "邮箱" do |user|
			link_to user.email, admin_user_path(user)
		end
	end
end
