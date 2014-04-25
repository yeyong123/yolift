ActiveAdmin.register Aftermarket do
	menu false
	filter :title, label: "标题"
	filter :created_at, label: "创建时间"

	index do
		selectable_column 
		column "序号" do |aft|
			aft.id
		end
		column "标题" do |aft|
			link_to aft.title, admin_aftermarket_path(aft)
		end
		column "创建时间" do |aft|
			aft.created_at
		end
	end

	show do
		div do
			raw aftermarket.content
		end
	end

	form partial: 'aftermarkets/new' 

end
