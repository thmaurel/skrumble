class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.references :trip, foreign_key: true
      t.references :task, foreign_key: true
      t.boolean :done

      t.timestamps
    end
  end
end
