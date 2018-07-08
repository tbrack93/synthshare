class SetDefaultBookingMessages < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :unreadmessages, :int, default: 0
  end
end
