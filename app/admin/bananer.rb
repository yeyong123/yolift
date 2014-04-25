ActiveAdmin.register Bananer do
	filter false

	index do
		selectable_column
		column "序号" do |banan|
			banan.id
		end
		column "图片" do |banan|
			link_to image_tag(banan.image_url(:small)), admin_bananer_path(banan)
		end
		column "链接地址" do |banan|
			banan.button
		end
	end

	show do 
		div do
			image_tag(bananer.image_url)
		end

		div do
			span bananer.button
		end
	end

end
