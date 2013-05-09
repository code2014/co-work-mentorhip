class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :price
      t.boolean :ongoing
      t.datetime :startdate
      t.datetime :enddate
      t.integer :user_id

      t.timestamps
    end
  end
end
