class Product < ActiveRecord::Base
	attr_accessible :detail, :category_id,:listtext, :excellent, :image,:paixu,:number, :printpdf, :techparams, :title,:outline, :video, :tag_id,:productcolor_ids, :productnumbers_attributes, :photos_attributes
	has_many :photos, dependent: :destroy
	default_scope order("paixu desc")
	has_many_kindeditor_assets :attachments, dependent: :destroy
	mount_uploader :printpdf, PrintpdfUploader
	mount_uploader :video, VideoUploader
	mount_uploader :image, ImageUploader
	accepts_nested_attributes_for :photos, allow_destroy: :true, update_only: true,
		reject_if: proc{ |attrs| attrs.all? {|k, v| v.blank? }}
	has_many :productnumbers, dependent: :destroy
	accepts_nested_attributes_for :productnumbers, allow_destroy: :true,
		reject_if: proc{ |attrs| attrs.all? {|k, v| v.blank? }}
	has_many :productcolors
	has_many :line_items
	has_many :orders, through: :line_items
	belongs_to :tag
	belongs_to :category

	validates_presence_of :title, :photos, :productnumbers
	validates_numericality_of :paixu, greater_than_or_equal_to: 0, less_than: 9999, allow_blank: true
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
