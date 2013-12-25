class Product < ActiveRecord::Base
	attr_accessible :detail, :listtext, :number, :printpdf, :techparams, :title, :video, :tag_id,:productcolor_ids, :productnumbers_attributes, :photos_attributes
	has_many :photos, dependent: :destroy
	mount_uploader :printpdf, PrintpdfUploader
	mount_uploader :video, VideoUploader
	accepts_nested_attributes_for :photos, allow_destroy: :true 
	has_many :productnumbers
	accepts_nested_attributes_for :productnumbers, allow_destroy: :true,
		reject_if: proc{ |attrs| attrs.all? {|k, v| v.blank? }}
	has_many :productcolors
	has_many :line_items

#	def add_product(line_item,product_id)
#		current_item = line_items.find_by_product_id(product_id)
#		if current_item
#			current_item.quantity += 1
#		else
#			current_item = current_item.line_items.build(line_item, product_id: product_id)
#
#		end
#			current_item
#	end

end
