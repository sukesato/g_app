class RemoveblogIdFromlabels < ActiveRecord::Migration[5.1]
  def change
    remove_column :labels, :blog_id, :integer
  end
end
