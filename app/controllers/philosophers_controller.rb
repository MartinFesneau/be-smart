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
  end
end
