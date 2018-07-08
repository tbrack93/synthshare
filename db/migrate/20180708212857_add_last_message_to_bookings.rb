class AddLastMessageToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :lastmessage, :datetime
    add_column :bookings, :unreadmessages, :int
  end
end
