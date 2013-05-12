class AddWeburlToUser < ActiveRecord::Migration
  def change
    add_column :users, :weburl, :string
  end
end
