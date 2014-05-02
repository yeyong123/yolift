# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * category_id [integer, limit=4] - belongs to :category
# * created_at [datetime, not null] - creation time
# * detail [text] - TODO: document me
# * excellent [integer, default=0, limit=4] - TODO: document me
# * image [string] - TODO: document me
# * listtext [text] - TODO: document me
# * outline [text] - TODO: document me
# * paixu [integer, default=0, limit=4] - TODO: document me
# * printpdf [string] - TODO: document me
# * tag_id [integer, limit=4] - belongs to :tag
# * techparams [text] - TODO: document me
# * title [string]
# * updated_at [datetime, not null] - last update time
# * view_count [integer, default=0, limit=4] - TODO: document me
class Product < ActiveRecord::Base
	attr_accessible :detail, :category_id,:listtext,:view_count, :excellent, :image,:paixu,:number, :printpdf, :techparams, :title,:outline, :tag_id,:productcolor_ids, :productnumbers_attributes, :photos_attributes,:videos_attributes
	has_many :photos, dependent: :destroy
	has_many_kindeditor_assets :attachments, dependent: :destroy
	mount_uploader :printpdf, PrintpdfUploader
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
	before_destroy :referenced_by_any_destroy
	has_many :videos, dependent: :destroy
	accepts_nested_attributes_for :videos, allow_destroy: :true,
		reject_if: proc{ |attrs| attrs.all? {|k, v| v.blank? }}

	validates_presence_of :title, :photos, :productnumbers
	validates_numericality_of :paixu, greater_than_or_equal_to: 0, less_than: 9999, allow_blank: true, uniqueness: true

	def referenced_by_any_destroy
		if line_items.empty?
			return true
		else
			errors.add(:base, "产品有关联")
			return false
		end
	end
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
