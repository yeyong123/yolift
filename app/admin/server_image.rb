ActiveAdmin.register ServerImage do
	menu false
	filter :created_at, label: "创建时间"
	index do
		selectable_column
		column "图片" do |sei|
			image_tag(sei.image_url(:narmail)) if sei.image?
		end
		default_actions
	end

	form partial: "server_images/edit_new"

end
