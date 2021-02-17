class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.string :phone
      t.string :fb_link
      t.text :maps

      t.timestamps
    end
  end
end
