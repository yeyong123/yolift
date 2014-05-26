ActiveAdmin.register ImageProduct do
	menu false
	filter :created_at, label: "创建时间"
	
	index do 
		selectable_column
		column "序号" do |image| 
			image.id
		end
		column "图片" do |image|
			 "#{image.product_images.count}张"
		end
		default_actions
	end

	show do
		div do
			table :class => "table" do
				image_product.product_images.each do |product|
					tr do
						td product.url
						td image_tag(product.image_url(:narmail)) if product.image?
					end
				end
			end
		end
	end

	form partial: 'image_products/new'
end
