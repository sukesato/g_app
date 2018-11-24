class AddBlogRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :blog, foreign_key: true
  end
end
