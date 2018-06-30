class ChangePriceToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :synths, :price, :int
    change_column :bookings, :price, :int
  end
end
