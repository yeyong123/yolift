# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * asset [string] - TODO: document me
# * asset_type [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * file_size [integer, limit=4] - TODO: document me
# * file_type [string] - TODO: document me
# * owner_id [integer, limit=4] - belongs to :owner
# * updated_at [datetime, not null] - last update time
class Kindeditor::Asset < ActiveRecord::Base
  self.table_name = 'kindeditor_assets'
  mount_uploader :asset, Kindeditor::AssetUploader
  validates_presence_of :asset
  before_save :update_asset_attributes
  attr_accessible :asset
  
  private
  def update_asset_attributes
    if asset.present? && asset_changed?
      self.file_size = asset.file.size
      self.file_type = asset.file.content_type
    end
  end
end
