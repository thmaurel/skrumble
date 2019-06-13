class AddAcceptedToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :accepted, :boolean
  end
end
