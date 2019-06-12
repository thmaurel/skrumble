class AddCategoyToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :category, :integer
  end
end
