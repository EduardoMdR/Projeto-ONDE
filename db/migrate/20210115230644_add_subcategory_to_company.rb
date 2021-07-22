class AddSubcategoryToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :subcategory_id, :integer
  end
end
