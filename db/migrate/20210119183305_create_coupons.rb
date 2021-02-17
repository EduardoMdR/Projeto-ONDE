class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :value
      t.integer :company_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :code

      t.timestamps
    end
  end
end
