class AddWeburlToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :weburl, :string
  end
end
