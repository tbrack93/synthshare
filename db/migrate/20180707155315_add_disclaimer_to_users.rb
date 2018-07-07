class AddDisclaimerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :disclaimer, :boolean
    add_column :users, :emailconsent, :boolean
  end
end
