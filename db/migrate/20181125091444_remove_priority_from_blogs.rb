class RemovePriorityFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :priority, :integer
  end
end
