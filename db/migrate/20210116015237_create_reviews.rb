class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.integer :price
      t.string :description
      t.integer :company_id

      t.timestamps
    end
  end
end
