ActiveAdmin.register Job do
	menu false
	filter :title, label: "职位名称"

	index do
		selectable_column
		column "职位名称"  do |job|
			link_to job.title, admin_job_path(job)
		end
		column "部门" do |job|
			job.department
		end
		column "创建时间" do |job|
			job.created_at.strftime("%Y-%m-%d")
		end
	end

	show do
		table :class => "table" do
			tr do
				td "职位名称: #{job.title}"
				td "工作地址: #{job.address}"
				td "部门: #{job.department}"
				td "发布时间: #{job.created_at.strftime("%Y-%m-%d")}"
			end
		end
		div do 
			h5 "职位描述:"
			div do
				raw job.content
			end
		end
	end

	form partial: 'jobs/new'
end
