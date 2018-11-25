class AddPriorityRefToLabels < ActiveRecord::Migration[5.1]
  def change
    add_reference :labels, :priority, foreign_key: true
  end
end
