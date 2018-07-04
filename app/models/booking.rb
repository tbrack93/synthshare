class Booking < ApplicationRecord
  belongs_to :synth
  belongs_to :user

  has_many :messages

  validates :start_time, presence: true
  validates :end_time, presence: true, date: { after_or_equal_to: :start_time}
  validates :details, length: { maximum: 100 }
end
