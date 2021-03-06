class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :synths
  has_many :bookings
  has_many :messages

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
