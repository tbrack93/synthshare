class Booking < ApplicationRecord
  belongs_to :synth
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true, date: { after: :start_time}
  validates :details, length: { maximum: 100 }
end
