class ChangeUserRatetoText < ActiveRecord::Migration
  def up
    change_column :users, :hourlyrate, :string
  end

  def down
  end
end
