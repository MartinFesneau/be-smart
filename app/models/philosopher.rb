class Philosopher < ApplicationRecord
  belongs_to :user
  validates :nationality, :last_name, :birthday, :specialty, :available_location, :prestations, :price_per_night, :description, presence: true
end
