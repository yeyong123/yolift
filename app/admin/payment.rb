ActiveAdmin.register Payment do
	menu false
	filter false

	index do
		selectable_column
		column "时间" do |pay|
			pay.created_at
		end

		column "标题" do |pay|
			link_to pay.title, admin_payment_path(pay)
		end
	end

	show do
		raw payment.content
	end

	form partial: 'payments/new'
end
