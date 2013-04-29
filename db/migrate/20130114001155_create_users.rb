class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :school
      t.text :hobbies
      t.float :gpa
      t.text :testscores
      t.string :major
      t.string :familyincome
      t.text :other

      t.timestamps
    end
  end
end
