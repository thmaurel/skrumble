class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mark_as_complete
    @todo = Todo.find(params[:id])
    authorize @todo
    @todo.done = true
    @todo.save
    respond_to do |format|
      # format.html { redirect_to trip_path(@trip_item.trip) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    #redirect_to trip_path(@todo.trip)
    end
  end
end
