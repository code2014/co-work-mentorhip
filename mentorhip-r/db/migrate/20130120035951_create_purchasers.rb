class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
