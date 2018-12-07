class AddTaskFlagToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :task_flag, :boolean, default: false, null: false
  end
end
