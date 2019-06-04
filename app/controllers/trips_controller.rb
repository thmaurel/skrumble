class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'pages/home'
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:country_id, :start_date, :end_date)
  end
end
