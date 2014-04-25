module ActiveAdmin
	module Views
		class Footer < Component
			def build
				super :id => "footer"
				div do
					span "Copyright &copy; #{Date.today.year} Yolift"
				end
			end
		end
	end
end
