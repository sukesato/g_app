class ChangeNameToPriorities < ActiveRecord::Migration[5.1]
  def change
    change_column :priorities, :name, 'integer USING CAST(name AS integer)'
  end
end
