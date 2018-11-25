class AddPriorityToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :priority, :integer, default: 1, null: false, limit: 2
  end
end
