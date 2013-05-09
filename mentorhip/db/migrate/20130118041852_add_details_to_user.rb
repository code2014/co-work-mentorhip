class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :details_id, :integer
    add_column :users, :details_type, :string
  end
end
