class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :process_time
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
