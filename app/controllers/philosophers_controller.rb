class PhilosophersController < ApplicationController
  def index
    @philosophers = Philosopher.all
  end

  def new
    @philosopher = Philosopher.new
  end
end
