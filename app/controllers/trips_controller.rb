class TripsController < ApplicationController

  def show
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def create
  end
end
