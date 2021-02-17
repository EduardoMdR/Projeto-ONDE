class AddOfferToReviewOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :review_offers, :offer_id, :integer
    add_column :review_offers, :answer, :text

    remove_column :review_offers, :company_id
  end
end
