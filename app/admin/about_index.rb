ActiveAdmin.register AboutIndex do
	menu false
	filter false

	index do 
		column "序号" do |about|
			link_to about.id, admin_about_index_path(about)
		end
		column "图片" do |about|
			image_tag(about.image_url(:small)) if about.image? 
		end
	end

	show do
		div do
			image_tag(about_index.image_url)
		end
		div do
			raw about_index.info
		end
	end

	form partial: "abouts/about_index"

end
