class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_line
      t.string :number
      t.string :cep
      t.string :city
      t.string :state
      t.string :complement
      t.string :recipient_name
      t.string :phone_number
      t.bigint :user_id

      t.timestamps
    end
  end
end
