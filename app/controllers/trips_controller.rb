class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    authorize @trip
    @new_trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    # @country = Country.find(params[:trip][:country_id])
    #country = Country.find_by(params[:name])
    # @trip.country = @country
    @trip.user = current_user
    @trip.accepted = true
    @trip.creator = current_user.id
    # @trip.user_id = current_user.id
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'pages/home'
    end
  end

  def share_new
    @shared_trip = Trip.new
    # @users = User.where.not(id: current_user.id)
    authorize @shared_trip
  end

  def share_create
    @trip = Trip.find(params[:id])
    @new_user = User.find_by(email: params[:trip][:user])
    if @new_user != current_user
    @new_trip = @trip.dup
    @new_trip.user = @new_user
    @new_trip.accepted = nil
    authorize @new_trip
    if @new_trip.save
      respond_to do |format|
        format.html { redirect_to trip_path(@trip) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'trips/show' }
        format.js
      end
    end
   end
  end

  def accept
    @trip = Trip.find(params[:trip_id])
    @trip.accepted = true
    authorize @trip
    @trip.save
    respond_to do |format|
      format.html { redirect_to trip_path(@trip) }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def decline
    @trip = Trip.find(params[:trip_id])
    @trip.accepted = false
    authorize @trip
    @trip.save
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js
    end
  end
  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :country_id)
  end
end
