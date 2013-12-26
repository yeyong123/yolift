module CartsHelper
	def innumber
		@cart.line_items.each do |item|
		#	line = item.productnumbers
		#	if line.empty?
		#		item.destroy
		#	end

		end
	end

end
