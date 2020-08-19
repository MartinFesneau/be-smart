class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :philosopher
  validates :start_date, :end_date, :address, presence: true
end
