class RemoveTripFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :trip, foreign_key: true
  end
end
