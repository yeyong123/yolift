ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
			ul do 
        li link_to "产品中心", admin_products_path, :class => "btn btn-primary btn-large"
				li link_to "大类图片", admin_category_images_path, :class => "btn btn-success btn-large"
				li link_to "二级分类图片",admin_tag_images_path, :class => "btn btn-danger btn-large"
				li link_to "关于我们首页图片", admin_about_indices_path, :class => "btn btn-warning btn-large"
				li link_to "产品中心导航图", admin_product_images_path, :class => "btn btn-large btn-info"
				li link_to "关于我们页面导航图", admin_about_images_path, :class => "btn btn-success btn-large"
				li link_to "导航图", admin_bananers_path, :class => "btn btn-danger btn-large"
				li link_to "关于我们", admin_abouts_path, :class => "btn btn-info btn-large"
				li link_to "新闻资讯大类", admin_servers_path, :class => "btn btn-primary btn-large"
				li link_to "新闻资讯列表", admin_zixuns_path, :class => "btn btn-success btn-large"
				li link_to "产品分类", admin_categories_path, :class => "btn btn-large btn-warning"
				li link_to "服务中心", admin_centers_path, :class => "btn btn-primary btn-large"
				li link_to "联系我们", admin_contacts_path, :class => "btn btn-success btn-large" 
				li link_to "售后服务", admin_aftermarkets_path, :class => "btn btn-primary btn-large"

        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
     column do
        panel "样册申请列表" do
          ul do
            Catelog.limit(10).each do |catelog|
              li link_to(catelog.name, admin_catelog_path(catelog))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
     end
  end # content
end
