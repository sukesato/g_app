class RemovePriorityIdFromLabels < ActiveRecord::Migration[5.1]
  def change
    remove_column :labels, :priority_id, :integer
  end
end
