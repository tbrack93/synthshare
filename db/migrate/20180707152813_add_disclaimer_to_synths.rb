class AddDisclaimerToSynths < ActiveRecord::Migration[5.2]
  def change
    add_column :synths, :disclaimer, :boolean
  end
end
