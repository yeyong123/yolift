ActiveAdmin.register Guide do
	menu false
	filter :created_at, label: "创建时间"
	filter :list, label: "采购指南类别"
	filter :title,label: "标题"

	index do 
		selectable_column
		column "序号" do |guide|
			guide.id
		end
		column "标题" do |guide|
			link_to guide.title, admin_guide_path(guide)
		end
		column "类别" do |guide|
			guide.list.title
		end
		column "创建时间" do |guide|
			guide.created_at.strftime('%Y-%m-%d')
		end
		default_actions
	end

	show do
		div do
			h4 "所属类别: #{guide.list.title}"
		end
		div do
			raw guide.content
		end
	end

	form partial: "guides/new"
end
