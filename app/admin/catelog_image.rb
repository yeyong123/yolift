ActiveAdmin.register CatelogImage do
	menu false
	filter false

	index do
		selectable_column
		column "序号" do |cate|
			cate.id
		end
		column "图片" do |cate|
			link_to image_tag(cate.image_url(:small)),admin_catelog_image_path(cate)
		end
		default_actions
	end
	
	show do
		div do
			image_tag(catelog_image.image_url)
		end
	end

	form partial: "catelog_images/new"
end
