class Philosopher < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :users, through :reservations
  has_many_attached :photos
  
  validates :nationality, :last_name, :birthday, :specialty, :available_location, :prestations, :price_per_night, :description, presence: true
end
