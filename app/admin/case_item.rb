ActiveAdmin.register CaseItem do
	menu false
	filter :title, label: "标题"
	filter :item, label: "分类"

	index do 
		selectable_column
		
		column "标题"	 do |ca|
			ca.title 
		end
		column "图片" do |ca|
			image_tag ca.image_url(:small)
		end
		column "简介" do |ca|
			raw (truncate (ca.content),length: 200)
		end
		default_actions
	end

	show do
		div do
			span  do
			case_item.item.title
			end
		end
		div do
			raw case_item.content
		end
	end


	form partial: 'case_items/new'

end
