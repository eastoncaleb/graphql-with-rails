class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :place_of_birth

      t.timestamps
    end
  end
end
