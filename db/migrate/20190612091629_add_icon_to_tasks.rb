class AddIconToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :icon, :string
  end
end
