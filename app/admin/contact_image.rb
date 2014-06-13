ActiveAdmin.register ContactImage do
	menu false
	filter :created_at, label: "创建时间"
	index do
		selectbale_column
		column "图片" do |ci|
			image_tag(ci.image_url(:narmail)) if ci.image?
		end
		default_actions
	end

	form partial: 'contact_images/edit_new'
end
