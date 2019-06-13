class AddCountryToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :country, foreign_key: true
  end
end
