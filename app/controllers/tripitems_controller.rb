class TripitemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mark_as_complete
    @trip_item = TripItem.find(params[:id])
    authorize @trip_item
    @trip_item.done = true
    @trip_item.save
    respond_to do |format|
      # format.html { redirect_to trip_path(@trip_item.trip) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    #redirect_to trip_path(@trip_item.trip)
    end
  end
end
