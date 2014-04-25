ActiveAdmin.register About do
	menu false
	filter :title, label: "标题"
	filter :created_at, label: "创建时间"

	index do
		selectable_column
		column "序号" do |about|
			about.id
		end
		column "标题" do |about|
			link_to about.title, admin_about_path(about)
		end
		column "创建时间" do |about|
			about.created_at
		end
	end

	show do
		div do
			raw about.content
		end
	end
	form partial: "abouts/new"


end
