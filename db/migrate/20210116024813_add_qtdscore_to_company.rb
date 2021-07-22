class AddQtdscoreToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :qtdscore, :integer
  end
end
