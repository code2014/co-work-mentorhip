class AddStreetAndCityAndCountryAndZipToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :street, :string
    add_column :orders, :city, :string
    add_column :orders, :country, :string, limit: 3
    add_column :orders, :zip, :integer, limit: 5
  end
end
