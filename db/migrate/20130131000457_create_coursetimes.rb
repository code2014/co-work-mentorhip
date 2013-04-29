class CreateCoursetimes < ActiveRecord::Migration
  def change
    create_table :coursetimes do |t|
      t.integer :course_id
      t.time :start
      t.time :end
      t.string :dayofweek

      t.timestamps
    end
  end
end
