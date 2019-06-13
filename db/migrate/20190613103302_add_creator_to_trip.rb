class AddCreatorToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :creator, :integer
  end
end
