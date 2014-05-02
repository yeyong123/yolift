# coding: utf-8

# Attributes:
# * id [integer, primary, not null, limit=4] - primary key
# * city_id [integer, limit=4] - belongs to :city
# * created_at [datetime, not null] - creation time
# * name [string]
# * pinyin [string] - TODO: document me
# * pinyin_abbr [string] - TODO: document me
# * updated_at [datetime, not null] - last update time
class District < ActiveRecord::Base
  if Rails.version < '4.0'
    attr_accessible :name, :city_id, :pinyin, :pinyin_abbr
  end

  belongs_to :city
  has_one :province, through: :city

  def short_name
    @short_name ||= name.gsub(/区|县|市|自治县/,'')
  end

  def brothers
    @brothers ||= District.where("city_id = #{city_id}")
  end

end
