# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * name [string]
# * pinyin [string] - TODO: document me
# * pinyin_abbr [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
class Province < ActiveRecord::Base
  if Rails.version < '4.0'
    attr_accessible :name, :pinyin, :pinyin_abbr
  end

  has_many :cities, dependent: :destroy
  has_many :districts, through: :cities
end
