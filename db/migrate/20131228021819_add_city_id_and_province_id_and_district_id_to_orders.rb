class AddCityIdAndProvinceIdAndDistrictIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :city_id, :integer
    add_column :orders, :province_id, :integer
    add_column :orders, :district_id, :integer
  end
end
