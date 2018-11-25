class AddBlogRefToLabels < ActiveRecord::Migration[5.1]
  def change
    add_reference :labels, :blog, foreign_key: true
  end
end
