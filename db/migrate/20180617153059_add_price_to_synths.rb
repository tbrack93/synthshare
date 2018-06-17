class AddPriceToSynths < ActiveRecord::Migration[5.2]
  def change
    add_column :synths, :price, :float
  end
end
