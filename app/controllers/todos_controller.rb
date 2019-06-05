class TodosController < ApplicationController

  def mark_as_complete
    @todo = Todo.find(params[:id])
    authorize @todo
    @todo.done = true
    @todo.save
    redirect_to trip_path(@todo.trip)
  end
end
