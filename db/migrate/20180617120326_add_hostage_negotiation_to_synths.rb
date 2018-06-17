class AddHostageNegotiationToSynths < ActiveRecord::Migration[5.2]
  def change
    add_column :synths, :hostagenegotiation, :boolean, default: false
  end
end
