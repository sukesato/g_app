class AddColumnsToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :content, :text
    add_column :blogs, :user_id, :integer
    add_column :blogs, :priority, :integer
  end
end
