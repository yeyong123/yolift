ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
			ul do 
        li link_to "产品中心", admin_products_path, :class => "btn btn-primary btn-large"
				li link_to "大类图片", admin_category_images_path, :class => "btn btn-success btn-large"
				li link_to "二级分类图片",admin_tag_images_path, :class => "btn btn-danger btn-large"
				li link_to "关于我们首页图片", admin_about_indices_path, :class => "btn btn-warning btn-large"
				li link_to "产品中心导航图", admin_image_products_path, :class => "btn btn-large btn-info"
				li link_to "关于我们页面导航图", admin_about_images_path, :class => "btn btn-success btn-large"
				li link_to "导航图", admin_bananers_path, :class => "btn btn-danger btn-large"
				li link_to "关于我们", admin_abouts_path, :class => "btn btn-info btn-large"
				li link_to "新闻资讯大类", admin_servers_path, :class => "btn btn-primary btn-large"
				li link_to "新闻资讯列表", admin_zixuns_path, :class => "btn btn-success btn-large"
				li link_to "产品分类", admin_categories_path, :class => "btn btn-large btn-warning"
				li link_to "服务中心", admin_centers_path, :class => "btn btn-primary btn-large"
				li link_to "联系我们", admin_contacts_path, :class => "btn btn-success btn-large" 
				li link_to "售后服务", admin_aftermarkets_path, :class => "btn btn-primary btn-large"
				li link_to "在线留言", admin_messages_path, :class => "btn btn-large btn-danger"
				li link_to "支付方式", admin_payments_path, :class => "btn btn-large btn-info"
				li link_to "案例", admin_case_items_path, :class => "btn btn-primary btn-large"
				li link_to "采购指南", admin_guides_path, :class => "btn btn-info btn-large"
				li link_to "配送服务", admin_ships_path, :class => "btn btn-danger btn-large"
				li link_to "项目案例类别", admin_items_path, :class => "btn btn-success btn-large"
				li link_to "工作机会", admin_jobs_path, :class => "btn btn-primary btn-large"

        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
     column do
        panel link_to "样册申请列表", admin_catelogs_path do
					table :class => "table" do
         		Catelog.order("created_at desc").limit(10).each do |catelog|
          		tr do
								td catelog.created_at.strftime("%Y-%m-%d")
              	td link_to(catelog.name, admin_catelog_path(catelog))
								td do
									if !catelog.deal?
										link_to "未处理", admin_catelog_path(catelog)
									else
										span :class => "deal-color" do
											"已处理"
										end
									end
								end
            	end
						end
          end
        end
      end

     column do
        panel link_to "订单详情", admin_orders_path do
					table :class => "table" do
          	Order.order("created_at desc").limit(10).each do |order|
							tr do
								td order.created_at.strftime("%Y-%m-%d")
								td link_to order.name, admin_order_path(order)
								td order.company
								td do
									if !order.deal?
										link_to "未处理", admin_order_path(order)
									else
										span :class => "deal-color" do
											"已处理"
										end
									end
								end
							end
						end
					end
        end
      end
     end
 columns do
     column do
        panel link_to "在线留言", admin_messages_path do
					table :class => "table" do
         		Message.order("created_at desc").limit(10).each do |message|
          		tr do
								td message.created_at.strftime("%Y-%m-%d")
              	td link_to(message.name, admin_message_path(message))
								td message.phone
								td do
									if !message.deal?
										link_to "未处理",admin_message_path(message)
									else
										span :class => "deal-color" do
											"已处理"
										end
									end
								end
            	end
						end
          end
        end
      end

     column do
        panel link_to "用户需求", admin_demands_path do
					table :class => "table" do
          	Demand.order("created_at desc").limit(10).each do |demand|
							tr do
								td demand.created_at.strftime("%Y-%m-%d")
								td link_to demand.name, admin_demand_path(demand)
								td demand.company
								td do
									if !demand.deal?
										link_to "未处理", admin_demand_path(demand)
									else
										span :class => "deal-color" do
											"已处理"
										end
									end
								end
							end
						end
					end
        end
      end
     end

  end # content
end
