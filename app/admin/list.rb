ActiveAdmin.register List do
	menu false
	filter :title, label: "标题" 
	index do
		selectable_column
		column "序号" do |list|
			list.id
		end
		column "标题" do |list|
			link_to list.title, admin_list_path(list)
		end
		column "创建时间" do |list|
			list.created_at
		end
		default_actions
	end

	form partial: 'lists/form'
end
