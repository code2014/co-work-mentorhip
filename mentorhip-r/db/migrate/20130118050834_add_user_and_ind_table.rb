class AddUserAndIndTable < ActiveRecord::Migration
  def up
    rename_table :users, :individuals
    
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.text :topics
      t.text :bio
      t.string   :token
      t.string   :hourlyrate
      t.float    :latitude
      t.float    :longitude
      t.string   :street
      t.string   :city
      t.string   :state
      t.string   :country
      t.string   :phonenumber
      t.string   :favoritecolor
      t.string   :avatar_file_name
      t.string   :avatar_content_type
      t.integer  :avatar_file_size
      t.integer  :details_id
      t.string   :details_type
      t.string :slug

      t.timestamps
    end
  end

  def down
  end
end
