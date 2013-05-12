class AddWeburlToIndividual < ActiveRecord::Migration
  def change
    add_column :individuals, :weburl, :string
  end
end
