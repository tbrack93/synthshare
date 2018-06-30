class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.bigint "user_id"
      t.bigint "synth_id"
      t.text "details"
      t.datetime "start_time"
      t.datetime "end_time"
      t.float "price"
      t.string "status", default: "pending"
      t.index ["synth_id"], name: "index_bookings_on_synth_id"
      t.index ["user_id"], name: "index_bookings_on_user_id"

      t.timestamps
    end
  end
end
