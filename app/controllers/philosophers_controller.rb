class PhilosophersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @philosophers = Philosopher.all
  end

  def new
    @philosopher = Philosopher.new
  end

  def show
    @philosopher = Philosopher.find(params[:id])
    @reservation = Reservation.new()
  end

  def create
    @philosopher = Philosopher.new(philosopher_params)
    @philosopher.user = current_user
    if @philosopher.save
      redirect_to philosopher_path(@philosopher)
    else
      render :new
    end
  end

  private

  def philosopher_params
    params.require(:philosopher).permit(
      :first_name, :last_name, :nationality, :birthday,
      :specialty, :available_location, :price_per_night,
      :description, :photo, prestations: []
    )
  end
end
