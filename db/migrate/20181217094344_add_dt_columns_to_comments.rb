class AddDtColumnsToComments < ActiveRecord::Migration[5.1]
  def change
     # コメントの作成日時明記に必要なカラム

      add_column :comments, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
      add_column :comments, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
