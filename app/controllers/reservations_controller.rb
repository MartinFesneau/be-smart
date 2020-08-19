class ReservationsController < ApplicationController

  def new 
    @philosopher = Philosopher.find(params[:philosopher_id])
    @reservation = Reservation.new()
  end

  def create
  end
end
