ActiveAdmin.register Zixun do
	filter :server, label: "所属资讯大类"
	filter :title, label: "标题"
	filter :content, label: "内容"
	filter :created_at, label: "创建时间"
	filter :updated_at, label: "更新时间"

	index do 
		selectable_column
		column "序号" do |zixun|
			zixun.id
		end
		column "标题" do |zixun|
			link_to zixun.title, admin_zixun_path(zixun)
		end
		column "所属类别" do |zixun|
			zixun.server.title
		end
	end

	show do
			div do
			raw zixun.content
		end
	end

	form partial: 'zixuns/new'
end
