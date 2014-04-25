ActiveAdmin.register AboutImage do
	menu false
	filter :created_at, label: "创建时间"

	index do 
		selectable_column
		column "序号" do |about|
			link_to about.id, admin_about_image_path(about)
		end
		column "图片" do |about|
			image_tag(about.image_url(:small)) if about.image? 
		end
	end
	
	show do
		h4 about_image.url
		div do
			image_tag(about_image.image_url)
		end
	end
	form partial: 'form'

end
