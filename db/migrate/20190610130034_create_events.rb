class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.text :description
      t.boolean :interested
      t.date :start_date
      t.date :end_date
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
