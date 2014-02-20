class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
	#
	# 有多个line_items,当购物车删除的时候。关联这个购物车的line_item也一并删除
	has_many :line_items, dependent: :destroy
	belongs_to :user
	#选择产品加入购物车的方法定义
	#当在产品显示页面中选择产品的ID。关联到line_item中，从line_item中查找产品ID
	#如果当前的line_item中已经有了这个产品，就在这个基础上,把这个产品自增一个
	#如果没有找这个产品。就在新建一个产品。并把这个产品添加进数据库。并进行计数。
	def add_product(line_item,product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item &&  
			current_item.quantity += 1
		else
			current_item =  line_items.build(product_id: product_id)  

		end
		current_item
	end

	def total_items
		line_items.sum(:quantity)
	end
end
