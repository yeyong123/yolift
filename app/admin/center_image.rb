ActiveAdmin.register CenterImage do
	menu false
	filter :created_at, label: "创建时间"
	index do
		selectable_column
		column "图片" do |cei|
			image_tag(cei.image_url(:narmail)) if cei.image?
		end
		default_actions
	end

	form partial: 'center_images/edit_new'
end
