class AddUserToSynth < ActiveRecord::Migration[5.2]
  def change
    add_reference :synths, :user, foreign_key: true
  end
end
