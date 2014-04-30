ActiveAdmin.register CategoryImage do
	menu false
	filter :created_at, label: "创建时间"
	filter :category, label: "所属大类", as: :select
	
	index do 
		selectable_column
		column "序号" do |category_image|
			link_to category_image.id, edit_admin_category_image_path(category_image)
		end
		column "图片" do |category_image|
			image_tag(category_image.image_url(:small)) if category_image.image?
		end
		column "大类" do |category_image| 
			category_image.category.name
		end
	end

			

	form partial: 'form'

end
