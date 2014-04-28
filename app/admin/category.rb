ActiveAdmin.register Category do
	menu false
	batch_actions = false
	filter false

	index do
		column "序号" do |cate|
			cate.id
		end
		column "名称" do |cate|
			link_to cate.name, admin_category_path(cate)
		end
		column "缩略图" do |cate|
			image_tag(cate.image_url(:small)) if cate.image?
		end
	end
	
	show do
		div do
			image_tag(category.image_url(:narmail)) if category.image?
		end
		div do
			h6 "包含的二级分类"
			table :class => "table" do
				category.tags.each do |tag|
					tr do
						td tag.name
						td image_tag(tag.image_url(:narmail)) if tag.image?
					end
				end
			end
		end
	end

	form partial: 'categories/form'

end
