class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @event = Event.find(params[:id])
    authorize @event.trip
  end
end
