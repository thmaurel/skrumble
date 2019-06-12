class RemoveInterestedFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :interested, :boolean
  end
end
