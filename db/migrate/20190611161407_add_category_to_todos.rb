class AddCategoryToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :category, :integer
  end
end
