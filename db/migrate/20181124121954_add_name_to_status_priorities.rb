class AddNameToStatusPriorities < ActiveRecord::Migration[5.1]
  def change
    change_column :priorities, :name, :integer, default: 1, null: false, limit: 2
  end
end
