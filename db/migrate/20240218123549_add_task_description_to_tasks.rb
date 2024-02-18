class AddTaskDescriptionToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :task_description, :string
  end
end
