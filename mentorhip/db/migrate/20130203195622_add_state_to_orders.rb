class AddStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string, limit: 2
  end
end
