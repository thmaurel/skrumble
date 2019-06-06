class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    country = Country.find_by(name: params[:country])
    @trip.country = country
    @trip.user_id = current_user.id
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'pages/home'
    end
  end

  def share_new
  end

  def share_create
    @shared_trip = Trip.find(params[:id])
    @new_trip = @shared_trip.dup
    @new_trip.user = current_user
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date)
  end
end
