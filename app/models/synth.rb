class Synth < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :body_format, presence: true, inclusion: { in: %w(Male Female Other)}
  validates :model_no, presence: true
  validates :processor, presence: true
  validates :memory, presence: true
  validates :battery_life, presence: true
  validates :build_date, presence: true
  validates :photo, presence: true
end
