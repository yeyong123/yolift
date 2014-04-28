ActiveAdmin.register Server do
	menu false
	filter false

	index do
		column "序号" do |server|
			server.id
		end
		column "标题" do |server|
			link_to server.title, edit_admin_server_path(server)
		end
		column "时间" do |server|
			server.created_at.strftime("%Y-%m-%d")
		end
	end

	form partial: "servers/new"
end
