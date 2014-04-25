ActiveAdmin.register Catelog do
	config.batch_actions = false
	actions :all, :except => [:edit,:new]
	filter :province, label: "地区"
	filter :deal, label: "是否处理", as: :check_boxes
	filter :mobel, label: "手机号"
	filter :company, label: "公司"
	filter :name, label: "姓名"
	filter :created_at, label: "申请时间"


	index do
		selectable_column
		column "时间" do |cate|
			cate.created_at
		end
		column "公司名称" do |cate|
			link_to cate.company, admin_catelog_path(cate)
		end
		column "姓名" do |cate|
			cate.name
		end
		column "手机" do |cate|
			cate.mobel
		end
		column "地区" do |cate|
			cate.city.name
		end
		column "处理" do |cate|
			if !cate.deal?
				link_to "待处理", admin_catelog_path(cate.id), :class => "btn btn-mini btn-danger"
			else
				span :class => "deal-color" do
				 	"已处理"
				end
			end
		end	
	end

	show do
		render 'catelogs/show'
	end
end
