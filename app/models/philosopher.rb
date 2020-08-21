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

  def self.available_on?(start_date, end_date)
    select { |philosopher| philosopher.available?(start_date, end_date) }
  end

  def available?(start_date, end_date)
    reservations.each do |reservation|
      return !(start_date >= reservation.start_date &&
        start_date <= reservation.end_date ||
        end_date >= reservation.start_date &&
        end_date <= reservation.end_date)
    end
  end
end
