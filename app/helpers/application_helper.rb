module ApplicationHelper
	def full_title(page_title)
		base_title = "高空作业平台_电动堆高车_电动搬运车_升降平台_力形(上海)自动化科技有限公司"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
