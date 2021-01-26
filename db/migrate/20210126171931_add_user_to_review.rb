class AddUserToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_id, :integer

    add_column :coupons, :limited, :boolean
    add_column :coupons, :qtd_coupon, :integer
  end
end
