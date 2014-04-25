ActiveAdmin.register CategoryImage do
	menu false
	filter :created_at, label: "创建时间"
	
	index do 
		selectable_column
		column "序号" do |category_image|
			link_to category_image.id, edit_admin_category_image_path(category_image)
		end
		column "图片" do |category_image|
			image_tag(category_image.image_url(:small)) if category_image.image?
		end
	end

			

	form partial: 'form'

end
