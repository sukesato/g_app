class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :profile_image
    end
  end
end
