class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end