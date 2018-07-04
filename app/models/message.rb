class Message < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :content, presence: true, length: { maximum: 100 }
end
