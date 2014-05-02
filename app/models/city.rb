# coding: utf-8

# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * created_at [datetime, not null] - creation time
# * level [integer, limit=4] - TODO: document me
# * name [string]
# * pinyin [string] - TODO: document me
# * pinyin_abbr [string] - TODO: document me
# * province_id [integer, limit=4] - belongs to :province
# * updated_at [datetime, not null] - last update time
# * zip_code [string] - TODO: document me
class City < ActiveRecord::Base
  if Rails.version < '4.0'
    attr_accessible :name, :province_id, :level, :zip_code, :pinyin, :pinyin_abbr
  end

  belongs_to :province
  has_many :districts, dependent: :destroy

  def short_name
    @short_name ||= name.gsub(/市|自治州|地区|特别行政区/,'')
  end

  def brothers
    @brothers ||= City.where("province_id = #{province_id}")
  end

end
