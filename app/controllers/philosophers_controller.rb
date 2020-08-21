class PhilosophersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @philosophers = Philosopher.geocoded

    @markers = @philosophers.map do |philosopher|
      {
        lat: philosopher.latitude,
        lng: philosopher.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { philosopher: philosopher })
      }
    end

    @philosophers = @philosophers.search_by_specialty(params[:specialty]) if params[:specialty].present?
    @philosophers = @philosophers.search_by_location(params[:location]) if params[:location].present?
    @philosophers = @philosophers.search_by_prestations(params[:prestations]) if params[:location].present?

    @philosophers = @philosophers.available_on?(DateTime.parse(params[:start_date]), DateTime.parse(params[:end_date])) if params[:start_date].present? && params[:end_date].present?

    # if params[:specialty].present? && params[:location].present? && params[:prestations].present?
    #   @philosophers = Philosopher.geocoded.search_by_specialty(params[:specialty]).search_by_location(params[:location]).search_by_prestations(params[:prestations])
    # elsif params[:specialty].present? && params[:location].present?
    #   @philosophers = Philosopher.geocoded.search_by_specialty(params[:specialty]).search_by_location(params[:location])
    # elsif params[:specialty].present? && params[:prestations].present?
    #   @philosophers = Philosopher.geocoded.search_by_specialty(params[:specialty]).search_by_prestations(params[:prestations])
    # elsif params[:prestations].present? && params[:location].present?
    #   @philosophers = Philosopher.geocoded.search_by_prestations(params[:prestations]).search_by_location(params[:location])
    # elsif params[:location].present?
    #   @philosophers = Philosopher.geocoded.search_by_location(params[:location])
    # elsif params[:specialty].present?
    #   @philosophers = Philosopher.geocoded.search_by_specialty(params[:specialty])
    # elsif params[:prestations].present?
    #   @philosophers = Philosopher.geocoded.search_by_prestations(params[:prestations])
    # else
    #   @philosophers
    # end
  end

  def list_owned
    @owned_philosophers = Philosopher.where(user_id: current_user.id)
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
      :first_name, :last_name, :nationality,
      :specialty, :address, :price_per_night,
      :description, :photo, prestations: []
    )
  end
end
