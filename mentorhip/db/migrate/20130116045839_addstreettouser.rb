class Addstreettouser < ActiveRecord::Migration
  def up
  	add_column :users, :street, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :country, :string
  end

  def down
  end
end
