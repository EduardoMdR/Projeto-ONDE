class CreateReviewOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :review_offers do |t|
      t.text :description
      t.integer :user_id
      t.integer :company_id
      t.integer :score

      t.timestamps
    end
  end
end
