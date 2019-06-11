class AddCategoryToTripItems < ActiveRecord::Migration[5.2]
  def change
    add_column :trip_items, :category, :integer
  end
end
