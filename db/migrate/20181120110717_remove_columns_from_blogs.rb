class RemoveColumnsFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :email, :string
    remove_column :blogs, :name, :string 
    remove_column :blogs, :password_digest,:string
    remove_column :blogs, :profile_image, :string 
  end
end
