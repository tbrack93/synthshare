class Synth < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :messages, through: :bookings
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 100 }
  validates :body_format, presence: true, inclusion: { in: %w(Male Female Other)}
  validates :model_no, presence: true, length: { maximum: 7}, format: { with: /PS[a-zA-Z0-9]{5}/ }
  validates :processor, presence: true
  validates :memory, presence: true
  validates :battery_life, presence: true
  validates :build_date, presence: true
  validates :photo, presence: true
  validates :price, presence: true
  validates :disclaimer, acceptance: { accept: true}

  def skills
    skills = []
    skills << "Cleaning" if self.cleaning == true
    skills << "Cooking" if self.cooking == true
    skills << "Childcare" if self.childcare == true
    skills << "Quantum Electrodynamics" if self.quantumelectrodynamics == true
    skills << "DIY" if self.diy == true
    skills << "Construction" if self.construction == true
    skills << "Painting" if self.painting == true
    skills << "Architectural Engineering" if self.architecturalengineering == true
    skills << "Gardening" if self.gardening == true
    skills << "Healthcare" if self.healthcare == true
    skills << "Elderlycare" if self.elderlycare == true
    skills << "Animalcare" if self.animalcare == true
    skills << "Cardiothoracic Surgery" if self.cardiothoracic == true
    skills << "Driving" if self.driving == true
    skills << "Self defense" if self.self_defense == true
    skills << "Security" if self.security == true
    skills << "Juggling" if self.entertainment == true
    skills << "Hostage Negotiation" if self.hostagenegotiation == true
    return skills
  end
end
