class TripitemsController < ApplicationController

  def mark_as_complete
    @trip_item = TripItem.find(params[:id])
    authorize @trip_item
    @trip_item.done = true
    @trip_item.save
    redirect_to trip_path(@trip_item.trip)
  end
end
