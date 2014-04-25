ActiveAdmin.register Product do
	config.batch_actions = false
	config.sort_order = 'paixu_desc'
	config.per_page = 10
	filter :title, label: "产品名称"
	filter :tag, label: "二级分类"
	filter :productnumbers_number, label: "货号", as: :string, collection: Productnumber.all.collect {|ph| [ph.number, ph.number]}

	
	index do 
		column "名称" do |product|
			link_to product.title, admin_product_path(product)
		end
		column "货号" do |product|
			product.productnumbers.first.number
		end
		column "二级类别" do |product|
			product.tag.name
		end
		column "图片" do |product|
			image_tag(product.image_url(:small))
		end
		column "序号" do |product|
			render partial: "home/product", locals: {product: product}
		end
	end

	show do
		h2 product.title
		product.productnumbers.each do |ph|
			h4 ph.number
		end
		div do
			raw product.outline
		end
		div do
			raw product.techparams
		end
	end
	form partial: 'form'

end
