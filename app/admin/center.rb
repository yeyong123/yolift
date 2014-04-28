ActiveAdmin.register Center do
	menu false
	filter :title
	filter :created_at

	index do
		selectable_column
		column "序号" do |center|
			center.id
		end
		column "标题" do |center|
			link_to center.title, admin_center_path(center)
		end
		column "创建时间" do |center|
			center.created_at.strftime("%Y-%m-%d")
		end
	end

	show do
		div do
			raw center.content
		end
	end

	form partial: "centers/new"

end
