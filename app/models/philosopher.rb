class Philosopher < ApplicationRecord
  PRESTATIONS = ["Debate", "Party", "Dance", "Balloons", "Striptease"]
  SPECIALTIES = ["Aesthetics", "Epistemology", "Ethics", "Logic"]

  include PgSearch::Model
  pg_search_scope :search_by_location,
                  against: [:address],
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_by_specialty,
                  against: [:specialty],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_prestations,
                  against: [:prestations],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :user
  has_one_attached :photo

  validates :nationality, :last_name, :specialty, :address, :prestations, :price_per_night, :description, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
