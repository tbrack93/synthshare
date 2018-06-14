class AddPhotoToSynths < ActiveRecord::Migration[5.2]
  def change
    add_column :synths, :photo, :string
  end
end
