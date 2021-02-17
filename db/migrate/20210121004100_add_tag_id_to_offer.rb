class AddTagIdToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :tag_id, :integer

    add_column :reviews, :answer, :text

    add_column :coupons, :description, :text
  end
end
