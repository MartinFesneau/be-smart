class Philosopher < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :user
  validates :nationality, :last_name, :birthday, :specialty, :available_location, :prestations, :price_per_night, :description, presence: true
  validates :prestations, inclusion: { in: Philosopher::PRESTATIONS }

  PRESTATIONS = ["Debate", "Party", "Dance", "Balloons", "Striptease"]
end
