class CreateLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :labels do |t|
      t.integer :blog_id
      t.integer :priority_id
    end
  end
end
