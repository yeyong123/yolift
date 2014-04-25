ActiveAdmin.register ProductImage do
	menu false

	filter :created_at, label: "创建时间"

	index do
		selectable_column
		column "序号" do |product|
			link_to product.id, edit_product_image_path(product)
		end

		column "图片" do |product|
			image_tag(product.image_url(:small)) if product.image?
		end
	end

	form partial: 'product_images/edit_new' 

end
