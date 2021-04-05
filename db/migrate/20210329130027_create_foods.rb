class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :promotion?
      t.float :old_price
      t.integer :qtd_max
      t.boolean :avaliable?
      t.integer :company_id

      t.timestamps
    end
  end
end
