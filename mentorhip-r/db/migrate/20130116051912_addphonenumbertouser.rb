class Addphonenumbertouser < ActiveRecord::Migration
  def up
  	add_column :users, :phonenumber, :string
  end

  def down
  end
end
