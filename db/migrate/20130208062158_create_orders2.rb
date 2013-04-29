class CreateOrders2 < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :course_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on
      t.string :email

      t.timestamps
    end
  end
end
