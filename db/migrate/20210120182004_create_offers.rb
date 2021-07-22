class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :name
      t.float :old_price
      t.float :new_price
      t.text :description
      t.integer :company_id
      t.integer :qtdscore
      t.datetime :start_time
      t.string :end_time
      t.string :datetime
      t.boolean :parceled
      t.integer :qtd_parcel
      t.boolean :cash
      t.boolean :credit_card

      t.timestamps
    end
  end
end
