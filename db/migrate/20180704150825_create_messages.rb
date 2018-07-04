class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text "content"
      t.bigint "user_id"
      t.bigint "booking_id"
      t.string "status", default: "new"

      t.index ["booking_id"], name: "index_messages_on_booking_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
      t.timestamps
    end
  end
end
