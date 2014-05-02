# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * asset [string] - TODO: document me
# * asset_type [string] - TODO: document me
# * created_at [datetime, not null] - creation time
# * file_size [integer, limit=4] - TODO: document me
# * file_type [string] - TODO: document me
# * owner_id [integer, limit=4] - belongs to :owner
# * updated_at [datetime, not null] - last update time
class Kindeditor::Image < Kindeditor::Asset
  mount_uploader :asset, Kindeditor::ImageUploader
end
