class AddDtColumnsToBlogs < ActiveRecord::Migration[5.1]
  def change
      # ブログの作成日時明記に必要なカラム

      add_column :blogs, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
      add_column :blogs, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
