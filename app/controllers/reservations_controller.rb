class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price, :address)
  end
end
