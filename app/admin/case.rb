ActiveAdmin.register Case do
	menu false
	filter :title, label: "标题"
	filter :item, label: "案例项目"
	index do
		selectable_column 
		column "序号" do |ca|
			ca.id
		end
		column "标题" do |ca|
			link_to ca.title, edit_admin_case_path(ca)
		end
		column "图片" do |ca|
			image_tag(ca.image_url(:small)) if ca.image?
		end
		column "内容" do |ca|
			raw ca.content
		end
		default_actions
	end

	form partial: "cases/new"	
end
