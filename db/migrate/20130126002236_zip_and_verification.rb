class ZipAndVerification < ActiveRecord::Migration
  def up
  	add_column :users, :zipcode, :string
  	add_column :users, :emailverified, :boolean

  end

  def down
  end
end
