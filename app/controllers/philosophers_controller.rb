class PhilosophersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @philosophers = Philosopher.geocoded

    if params['start_date'].present?
      @start_date = params['start_date'].split('to')[0].strip
      @end_date = params['start_date'].split('to')[1].strip
    end


    @philosophers = @philosophers.search_by_location(params[:location]) if params[:location].present?
    @philosophers = @philosophers.search_by_prestations(params[:prestations]) if params[:prestations].present?
    @philosophers = @philosophers.search_by_specialty(params[:specialty]) if params[:specialty].present?

    @philosophers = @philosophers.available_on?(DateTime.parse(@start_date), DateTime.parse(@end_date)) if params['start_date'].present?

    @markers = @philosophers.map do |philosopher|
      {
        lat: philosopher.latitude,
        lng: philosopher.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { philosopher: philosopher })
      }
    end
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
