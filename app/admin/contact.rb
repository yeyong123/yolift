ActiveAdmin.register Contact do
	menu false
	filter false

	index do
		selectable_column
		column "序号" do |con|
			con.id
		end
		column "标题" do |con|
			link_to con.title, admin_contact_path(con)
		end
		column "创建时间" do |con|
			con.created_at.strftime("%Y-%m-%d")
		end

		default_actions
	end

	show do
		div do
			raw contact.content
		end
	end

	form partial: 'contacts/new' 
end
