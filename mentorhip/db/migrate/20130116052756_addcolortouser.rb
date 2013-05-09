class Addcolortouser < ActiveRecord::Migration
  def up
  	add_column :users, :favoritecolor, :string
  end

  def down
  end
end
