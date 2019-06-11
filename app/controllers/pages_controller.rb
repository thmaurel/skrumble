class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trip = Trip.new
  end

  def dashboard
    @count = {}
    current_user.trips.each do |trip|
      counter = 0
      trip.trip_items.each do |item|
        counter += 1 if item.done
      end
      counter2 = 0
      trip.todos.each do |task|
        counter2 += 1 if task.done
      end
      @count[trip] = {items: counter, todos: counter2}
    end
    @trip = Trip.new
  end
end
