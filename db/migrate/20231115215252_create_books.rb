class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.float :rating
      t.integer :year_published
      t.text :description

      t.timestamps
    end
  end
end
