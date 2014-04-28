ActiveAdmin.register Ship do
	menu false
	filter :title, label: "标题"
	filter :created_at, label: "时间"

	index do 
		selectable_column
		column "时间" do |ship|
			ship.created_at.strftime("%Y-%m-%d")
		end
		column "标题" do |ship|
		 link_to ship.title, admin_ship_path(ship)
		end
		default_actions
	end		

	show do
		raw ship.content
	end

form partial: 'ships/new'
end
