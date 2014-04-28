ActiveAdmin.register Item do
	menu false
	filter false

	index do
		column "序号" do |item|
			item.id
		end
		column "标题" do |item|
			item.title
		end
		default_actions
	end

	form partial: "items/new"

end
