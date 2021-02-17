class AddTimeToOffer < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :end_time
    remove_column :offers, :datetime

    add_column :offers, :end_time, :datetime
  end
end
